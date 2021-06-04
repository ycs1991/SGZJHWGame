#import "SanGuo_GameViewController.h"
#import <LCProgressHUD.h>
#import "SanGuo_BaseInfoModel.h"
#import "SanGuo_APIHeader.h"
#import "SanGuo_NetWorkingTools.h"
#import "SanGuo_AESDataTools.h"
#import "SanGuo_DataDotTools.h"
#import "LCProgressHUD.h"
#import <Adjust/Adjust.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface SanGuo_GameViewController ()
@end
@implementation SanGuo_GameViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sanguo_completeTransaction:) name:@"completeTransaction" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sanguo_failedTransaction) name:@"failedTransaction" object:nil];
    self.sanguo_userAppCLick = 0;
}

- (UIImageView *)sanguo_startImageV {
    if (_sanguo_startImageV == nil) {
        _sanguo_startImageV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _sanguo_startImageV.image = [UIImage imageNamed:BACKIMAGE];
        _sanguo_startImageV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _sanguo_startImageV;
}


- (SanGuo_GameView *)sanguo_gamesBackView {
    if (_sanguo_gamesBackView == nil) {
        _sanguo_gamesBackView = [[SanGuo_GameView alloc] init];
        _sanguo_gamesBackView.frame = self.view.bounds;
        _sanguo_gamesBackView.sanguo_delegate = self;
        NSString *sanguo_UAT = [NSString stringWithFormat:@"%@%@%@", @"navig", @"ator.use", @"rAgent"];
        [_sanguo_gamesBackView sanguo_serverNotificationMsg:sanguo_UAT completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            [[NSUserDefaults standardUserDefaults] setObject:result forKey:kDefaultUserAgent];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    }
    return _sanguo_gamesBackView;
}

- (void)sanguo_fbloginSuccess:(NSDictionary *)dic {
    NSString *dataJson = [SanGuo_BaseInfoModel sanguo_mangledDabsterFun_sanguo:dic];
    [self.sanguo_gamesBackView sanguo_serverNotificationMsg:[NSString stringWithFormat:@"FBUser(%@)", dataJson] completionHandler:^(id _Nullable finished, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"12312312312312");
        }
    }];
}


- (void)sanguo_removeLoginView:(NSDictionary *)dic {
    NSString *productCode = dic[@"product_code"];
    NSString *productKey = dic[@"product_key"];
    [[NSUserDefaults standardUserDefaults] setValue:productCode forKey:ProductCode];
    [[NSUserDefaults standardUserDefaults] setValue:productKey forKey:ProductKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [LCProgressHUD hide];
    [self.sanguo_sendImageV removeFromSuperview];

    ADJEvent *event = [ADJEvent eventWithEventToken:@"d37vaw"];
    [event addCallbackParameter:@"product_code" value:productCode];
    [Adjust trackEvent:event];

    self.sanguo_clickTimer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(sanguo_startTheTime:) userInfo:nil repeats:YES];
}

- (void)sanguo_startTheTime:(NSTimer *)timer {
    if (self.sanguo_userAppCLick > 0) {
        ADJEvent *event = [ADJEvent eventWithEventToken:@"q73ahw"];
        NSString *productCode = [[NSUserDefaults standardUserDefaults] objectForKey:ProductCode];
        [event addCallbackParameter:@"product_code" value:productCode];
        [event addCallbackParameter:@"click_times" value:[NSString stringWithFormat:@"%ld", self.sanguo_userAppCLick]];
        [Adjust trackEvent:event];
        self.sanguo_userAppCLick = 0;
    }
}

- (void)sanguo_iosInitSuccess:(NSDictionary *)dic {
    NSString *productCode = dic[@"productCode"];
    NSString *productKey = dic[@"productKey"];
    [[NSUserDefaults standardUserDefaults] setValue:productCode forKey:ProductCode];
    [[NSUserDefaults standardUserDefaults] setValue:productKey forKey:ProductKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [SanGuo_NetWorkingTools sanguo_loadInitCompleteDataProductCode:productCode productKey:productKey success:^(NSDictionary * _Nonnull response) {
        NSString *decodeStr = [SanGuo_AESDataTools sanguo_getDataEncryptTextFunc_sanguo:(NSString *)response];
        NSDictionary *dic = [SanGuo_BaseInfoModel sanguo_rangePart_sanguo:decodeStr];
        NSString *dataJson = [SanGuo_BaseInfoModel sanguo_mangledDabsterFun_sanguo:dic];
        NSString *callbackStr = [NSString stringWithFormat:@"na%@eSd%@tC%@ack(%@)", @"tiv", @"kIni", @"allb", dataJson];
        [self.sanguo_gamesBackView sanguo_serverNotificationMsg:callbackStr completionHandler:^(id _Nullable finished, NSError * _Nullable error) {
            if (error == nil) {
                [SanGuo_DataDotTools sanguo_getActivationDataFunc_sanguo];
            }
        }];
    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)sanguo_applePayEvent:(NSDictionary *)dic {
//    NSLog(@"applePay info == %@", dic);
    self.sanguo_appleDic = dic;
    [LCProgressHUD showLoading:@"In payment..."];
    [SanGuo_NetWorkingTools sanguo_loadApplePayRequestData:dic];
}

- (void)sanguo_costomEventSuccess:(nonnull NSDictionary *)dic {}

- (void)sanguo_createRolesSuccess:(nonnull NSDictionary *)dic {}

- (void)sanguo_loginSuccessed {}


- (void)sanguo_completeTransaction:(NSNotification *)noti {
    NSDictionary *dic = noti.userInfo;
    [SanGuo_NetWorkingTools sanguo_loadApplePayCompletedRequestData:dic infoDic:self.sanguo_appleDic];
}

- (void)sanguo_failedTransaction {
    NSLog(@"Purchase failed");
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
- (void)sanguo_TapClick:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:self.view];
    self.sanguo_labelTouch = point.y;
    self.sanguo_userAppCLick += 1;

}
- (void)keyboardWillHide:(NSNotification*) info
{
    CGRect rect = self.view.frame;
    rect.origin.y = 0;
    self.view.frame = rect;
    self.sanguo_gamesBackView.frame = rect;
    self.sanguo_gamesBackView.sanguo_mainScrollView.contentSize = CGSizeZero;
}
- (void)keyboardWillShow:(NSNotification *)info
{
    NSDictionary *keyBordInfo = [info userInfo];
    NSValue *value = [keyBordInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoardRect = [value CGRectValue];
    float height = keyBoardRect.size.height;
    CGRect beginRect = [[keyBordInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect = [[keyBordInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if(beginRect.size.height > 0 && (beginRect.origin.y - endRect.origin.y > 0)){
        float distance = [UIScreen mainScreen].bounds.size.height - self.sanguo_labelTouch;
        if(distance < height)
        {
            self.sanguo_xslDistance = height - distance + 20;
            CGRect originFrame = self.sanguo_gamesBackView.frame;
            originFrame.origin.y = self.view.frame.origin.y - self.sanguo_xslDistance;
            self.sanguo_gamesBackView.frame = originFrame;
            self.sanguo_gamesBackView.sanguo_mainScrollView.contentSize = CGSizeZero;
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)sanguo_tapGestureLocateFunc_sanguo:(UIView *)v {
    UITapGestureRecognizer *sanguo_Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sanguo_TapClick:)];
    sanguo_Tap.numberOfTouchesRequired = 1;
    sanguo_Tap.numberOfTapsRequired = 1;
    sanguo_Tap.delegate = self;
    sanguo_Tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:sanguo_Tap];
}

- (NSDictionary *)sanguo_appleDic {
    if (_sanguo_appleDic == nil) {
        _sanguo_appleDic = [NSDictionary dictionary];
    }
    return _sanguo_appleDic;
}


@end
