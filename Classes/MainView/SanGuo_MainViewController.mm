
#import "SanGuo_MainViewController.h"
#import "SanGuo_APIHeader.h"
#import "SanGuo_NetWorkingTools.h"
#import "SanGuo_AESDataTools.h"
#import "SanGuo_BaseInfoModel.h"
#import "SanGuo_DataDotTools.h"
#import "UnityAppController+ViewHandling.h"
#import <LCProgressHUD.h>
#import <CoreTelephony/CTCellularData.h>


@interface SanGuo_MainViewController ()

@end

@implementation SanGuo_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    self.sanguo_gamesBackView.frame = self.view.bounds;
    [self.view addSubview:self.sanguo_gamesBackView];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageV.image = [UIImage imageNamed:BACKIMAGE];
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.sanguo_sendImageV = imageV;
    [self.view addSubview:imageV];
}

- (void)sanguo_setupConfigView_sanguo:(UIView *)vc {
    [self sanguo_networkState:vc];
}

- (void)sanguo_networkState:(UIView *)vc {
    CTCellularData *cellularData = [[CTCellularData alloc] init];
    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state){
        switch (state) {
            case kCTCellularDataRestricted:
            {
                NSLog(@"Restricted");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self sanguo_gotoGamePlay:vc];
                });
            }
                break;
            case kCTCellularDataNotRestricted:
            {
                NSLog(@"NotRestricted");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self sanguo_gotoGamePlay:vc];
                });
            }
                break;
            case kCTCellularDataRestrictedStateUnknown:
            {
                NSLog(@"RestrictedStateUnknown");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self sanguo_gotoGamePlay:vc];
                });
            }
                break;
            default:
                break;
        }
    };
}

- (void)sanguo_gotoGamePlay:(UIView *)vc {
    [self sanguo_tapGestureLocateFunc_sanguo:vc];
    [vc addSubview:self.sanguo_startImageV];
    WNWeakSelf(weakSelf);
    [SanGuo_NetWorkingTools sanguo_loadFirstGameDataFunc:^(NSDictionary * _Nonnull response) {
        NSString *decodeStr = [SanGuo_AESDataTools sanguo_getDataEncryptTextFunc_sanguo:(NSString *)response];
        NSDictionary *dic = [SanGuo_BaseInfoModel sanguo_rangePart_sanguo:decodeStr];
        NSString *sanguo_priStr = [NSString stringWithFormat:@"%@iva%@", @"pr", @"cy"];
        weakSelf.sanguo_privaData = [dic[sanguo_priStr] intValue];
        [[NSUserDefaults standardUserDefaults] setValue:dic[@"app_name"] forKey:@"app_name"];
        [[NSUserDefaults standardUserDefaults] setValue:dic[@"a"] forKey:@"a"];
        [[NSUserDefaults standardUserDefaults]
         setInteger:weakSelf.sanguo_privaData forKey:sanguo_priStr];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSString *sanguo_jsonStr = [SanGuo_AESDataTools sanguo_getDataEncryptTextFunc_sanguo:dic[@"i"]];
        NSString *sanguo_initStr = [[sanguo_jsonStr stringByReplacingOccurrencesOfString:@"\\" withString:@""] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        NSString *sanguo_IPStr = [NSString stringWithFormat:@"%@%@", @"i", @"p"];
        [weakSelf.sanguo_startImageV removeFromSuperview];
        [SanGuo_DataDotTools sanguo_getStartGameDataFunc_sanguo];
        if (weakSelf.sanguo_privaData == 1) { return; }
        [UIApplication sharedApplication].keyWindow.rootViewController = weakSelf;
        [LCProgressHUD showLoading:@"Entering the game..."];
        [weakSelf sanguo_InitView:sanguo_initStr ipStr:dic[sanguo_IPStr]];
    } failure:^(NSError * _Nonnull error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Prompt" message:@"Network connection failed, please try again!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self sanguo_setupConfigView_sanguo:vc];
        }];
        [alert addAction:action];
        [[SanGuo_BaseInfoModel sanguo_decisionClassificationRab_sanguo] presentViewController:alert animated:YES completion:nil];
    }];
}

- (void)sanguo_InitView:(NSString *)name ipStr:(NSString *)str{
//    name = @"https://play.pthzwl.net/game/ios";
    NSString *initStr = [NSString stringWithFormat:@"%@?product_code=%@&t=%@", name, sanguo_PRODUCT_CODE, [SanGuo_BaseInfoModel sanguo_getCurrentTimeData_sanguo]];
    [self.sanguo_gamesBackView sanguo_loadDatasInitPathStr:initStr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.sanguo_gamesBackView.sanguo_mainScrollView.contentSize = CGSizeMake(0, 0);
    [self.view endEditing:YES];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
