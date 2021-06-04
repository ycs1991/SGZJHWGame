
#import "SanGuo_GameView.h"
#import <objc/runtime.h>
#import "SanGuo_BaseInfoModel.h"
#import "SanGuo_APIHeader.h"
#import <LCProgressHUD/LCProgressHUD.h>
#import <Adjust/Adjust.h>
#import <SafariServices/SafariServices.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height
@interface SanGuo_GameView ()
@end
@implementation SanGuo_GameView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sanguo_setupUI];
        [self sanguo_showMoreFunc];
    }
    return self;
}

- (void)sanguo_setupUI {
    NSString *sanguo_mainUIStr = [NSString stringWithFormat:@"W%@ebV%@w", @"KW", @"ie"];
    Class sanguo_mainClass = NSClassFromString(sanguo_mainUIStr);
    self.sanguo_mainView = [[sanguo_mainClass alloc] init];
    self.sanguo_mainView.frame = self.bounds;
    self.sanguo_mainView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.sanguo_mainView];
    self.sanguo_mainView.frame = self.bounds;

    NSString *sanguo_naviDele = [NSString stringWithFormat:@"se%@gationD%@te:", @"tNavi", @"elega"];
    SEL sanguo_naviDeleMethod = NSSelectorFromString(sanguo_naviDele);
    BOOL sanguo_isSelNaviDele = [self.sanguo_mainView respondsToSelector:sanguo_naviDeleMethod];
    if (sanguo_isSelNaviDele) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.sanguo_mainView methodForSelector:NSSelectorFromString(sanguo_naviDele)];
            void(* func)(id, SEL, id) = (void *)imp;
            func(self.sanguo_mainView, NSSelectorFromString(sanguo_naviDele), self);
        });
    }
    NSString *sanguo_uiDele = [NSString stringWithFormat:@"se%@D%@te:", @"tUI", @"elega"];
    SEL sanguo_uiDeleMethod = NSSelectorFromString(sanguo_uiDele);
    BOOL sanguo_isSelUIDele = [self.sanguo_mainView respondsToSelector:sanguo_uiDeleMethod];
    if (sanguo_isSelUIDele) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.sanguo_mainView methodForSelector:NSSelectorFromString(sanguo_uiDele)];
            void(* func)(id, SEL, id) = (void *)imp;
            func(self.sanguo_mainView, NSSelectorFromString(sanguo_uiDele), self);
        });
    }

    NSString *sanguo_configrationStr = [NSString stringWithFormat:@"confi%@tion.%@rCont%@oller", @"gura", @"use", @"entContr"];
    NSString *sanguo_userContentControClass = [NSString stringWithFormat:@"W%@ontent%@oller", @"KUserC", @"Contr"];
    NSString *sanguo_addScrpStr = [NSString stringWithFormat:@"add%@iptM%@eHandl%@name:", @"Scr", @"essag", @"er:"];
    Class sanguo_contentClass = NSClassFromString(sanguo_userContentControClass);
    id sanguo_contentCtrler = [[sanguo_contentClass alloc] init];
    [self.sanguo_mainView setValue:sanguo_contentCtrler forKeyPath:sanguo_configrationStr];
    sanguo_contentCtrler = [self.sanguo_mainView valueForKeyPath:sanguo_configrationStr];
    SEL sanguo_scrSel = NSSelectorFromString(sanguo_addScrpStr);
    NSString *para1 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo1"];
    NSString *para2 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo2"];
    NSString *para3 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo3"];
    NSString *para4 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo4"];
    NSString *para8 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo8"];
    NSString *para9 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo9"];
    NSString *para10 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo10"];
    NSString *para11 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo11"];
    NSString *para12 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo12"];
    NSString *para13 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo13"];
    NSString *para14 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo14"];
    NSString *para15 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo15"];
    NSString *para16 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo16"];

    NSMutableArray *paraArray = @[para1, para2, para3, para4, para8, para9, para10, para11, para12, para13, para14, para15, para16].mutableCopy;
    if (sanguo_contentCtrler) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [paraArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *nameMethod = [SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:obj];
                    IMP imp = [sanguo_contentCtrler methodForSelector:sanguo_scrSel];
                    void(* func)(id, SEL, id, id) = (void *)imp;
                    func(sanguo_contentCtrler, sanguo_scrSel, self, nameMethod);
                });
            }];
        });
    }
    for (UIView *subView in self.sanguo_mainView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sc = (UIScrollView *)subView;
            self.sanguo_mainScrollView = sc;
            sc.bounces = NO;
            if (@available(iOS 11.0, *)) {
                sc.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
    }

}

- (void)dealloc
{
    NSString *sanguo_configrationStr = [NSString stringWithFormat:@"confi%@tion.%@rCont%@oller", @"gura", @"use", @"entContr"];
    NSString *sanguo_userContentControClass = [NSString stringWithFormat:@"W%@ontent%@oller", @"KUserC", @"Contr"];
    NSString *sanguo_remScrpStr = [NSString stringWithFormat:@"rem%@iptM%@eHandl%@Name:", @"oveScr", @"essag", @"erFor"];
    Class sanguo_contentClass = NSClassFromString(sanguo_userContentControClass);
    id sanguo_contentCtrler = [[sanguo_contentClass alloc] init];
    [self.sanguo_mainView setValue:sanguo_contentCtrler forKeyPath:sanguo_configrationStr];
    sanguo_contentCtrler = [self.sanguo_mainView valueForKeyPath:sanguo_configrationStr];
    SEL rescrSel = NSSelectorFromString(sanguo_remScrpStr);
    NSString *para1 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo1"];
    NSString *para2 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo2"];
    NSString *para3 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo3"];
    NSString *para4 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo4"];
    NSString *para8 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo8"];
    NSString *para9 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo9"];
    NSString *para10 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo10"];
    NSString *para11 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo11"];
    NSString *para12 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo12"];
    NSString *para13 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo13"];
    NSString *para14 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo14"];
    NSString *para15 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo15"];
    NSString *para16 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo16"];

    NSMutableArray *paraArray = @[para1, para2, para3, para4, para8, para9, para10, para11, para12, para13, para14, para15, para16].mutableCopy;
    if (sanguo_contentCtrler) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [paraArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *nameMethod = [SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:obj];
                    IMP imp = [sanguo_contentCtrler methodForSelector:rescrSel];
                    void(* func)(id, SEL, id, id) = (void *)imp;
                    func(sanguo_contentCtrler, rescrSel, self, nameMethod);
                });
            }];
        });
    }
}

- (void)sanguo_serverNotificationMsg:(NSString *)message completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHander {
    NSString *eveSelStr = [NSString stringWithFormat:@"ev%@ateJa%@ipt:%@etionH%@er:", @"alu", @"vaScr", @"compl" ,@"andl"];
    SEL eveOriginSel = NSSelectorFromString(eveSelStr);
    if (self.sanguo_mainView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            IMP imp = [self.sanguo_mainView methodForSelector:eveOriginSel];
            void(* func)(id,SEL,id,id) = (void *)imp;
            func(self.sanguo_mainView, eveOriginSel, message, completionHander);
        });
    }

}


- (void)sanguo_showMoreFunc {

    NSString *sanguo_decidePolicyNav = [NSString stringWithFormat:@"w%@iew:de%@rNavigat%@decisionH%@", @"ebV", @"cidePolicyFo", @"ionAction:", @"andler:"];
    SEL sanguo_decidePolicyNavMethod = NSSelectorFromString(sanguo_decidePolicyNav);
    SEL sanguo_replaceDecidePolicyNavMethod = NSSelectorFromString(@"sanguo_MainContentView:deMainViewPolicyNaviForAction:decisionHandler:");
    [self sanguo_firstMainMethod:sanguo_decidePolicyNavMethod secondMethod:sanguo_replaceDecidePolicyNavMethod];

    NSString *sanguo_ContentControl = [NSString stringWithFormat:@"use%@tC%@didRecei%@tMess%@", @"rConten", @"ontroller:", @"veScrip", @"age:"];
    SEL newKigndom_didReceiveMethod = NSSelectorFromString(sanguo_ContentControl);
    SEL sanguo_replaceDidReceiveMethod = NSSelectorFromString(@"sanguo_MainContentViewCtr:didMainViewReceiveMessaged:");
    [self sanguo_firstMainMethod:newKigndom_didReceiveMethod secondMethod:sanguo_replaceDidReceiveMethod];

    NSString *sanguo_textInputPanel = [NSString stringWithFormat:@"we%@w:ru%@criptTe%@thPrompt:%@ext:initia%@e:comple%@ler:", @"bVie", @"nJavaS", @"xtInputPanelWi", @"defaultT", @"tedByFram", @"tionHand"];
    SEL sanguo_textInputPanelMethod = NSSelectorFromString(sanguo_textInputPanel);
    SEL sanguo_replaceTextInputPanelMethod = NSSelectorFromString(@"sanguoMainContentView:runMainViewTextPutOtherPrompt:defaultMainViewText:initMainViewFrame:completionHandler:");
    [self sanguo_firstMainMethod:sanguo_textInputPanelMethod secondMethod:sanguo_replaceTextInputPanelMethod];

    NSString *sanguo_confirmPanel = [NSString stringWithFormat:@"we%@w:ru%@criptConfi%@thMessage:%@ByF%@:comple%@ler:", @"bVie", @"nJavaS", @"rmPanelWi", @"initiated", @"rame", @"tionHand"];
    SEL sanguo_confirmPanelMethod = NSSelectorFromString(sanguo_confirmPanel);
    SEL sanguo_replaceConfirmPanelMethod = NSSelectorFromString(@"sanguoMainContentView:runMainViewConfirmPanelMessage:initiatedByFrame:completionHandler:");
    [self sanguo_firstMainMethod:sanguo_confirmPanelMethod secondMethod:sanguo_replaceConfirmPanelMethod];

    NSString *sanguo_AlertPanel = [NSString stringWithFormat:@"we%@w:ru%@criptAlertPa%@thMessage:%@ByF%@:comple%@ler:", @"bVie", @"nJavaS", @"nelWi", @"initiated", @"rame", @"tionHand"];
    SEL sanguo_AlertPanelMethod = NSSelectorFromString(sanguo_AlertPanel);
    SEL sanguo_replaceAlertPanelMethod = NSSelectorFromString(@"sanguoMainContentView:runMainViewAlertPanelMessage:initiatedByFrame:completionHandler:");
    [self sanguo_firstMainMethod:sanguo_AlertPanelMethod secondMethod:sanguo_replaceAlertPanelMethod];
}

- (void)sanguoMainContentView:(id)mainContentView runMainViewConfirmPanelMessage:(NSString *)message initiatedByFrame:(id)frame completionHandler:(void (^)(BOOL))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Prompt" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [[SanGuo_BaseInfoModel sanguo_decisionClassificationRab_sanguo] presentViewController:alertController animated:YES completion:nil];
}

- (void)sanguoMainContentView:(id)mainContentView runMainViewAlertPanelMessage:(NSString *)message initiatedByFrame:(id)frame completionHandler:(void (^)(BOOL))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Prompt" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [[SanGuo_BaseInfoModel sanguo_decisionClassificationRab_sanguo] presentViewController:alertController animated:YES completion:nil];

}


- (void)sanguo_MainContentViewCtr:(id)contentContorller didMainViewReceiveMessaged:(id)message {
    NSString *name = [message valueForKey:@"name"];
    NSString *para1 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo1"];
    NSString *para2 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo2"];
    NSString *para3 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo3"];
    NSString *para4 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo4"];
    NSString *para8 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo8"];
    NSString *para9 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo9"];
    NSString *para11 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo11"];
    NSString *para10 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo10"];
    NSString *para12 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo12"];
    NSString *para13 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo13"];
    NSString *para14 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo14"];
    NSString *para15 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo15"];
    NSString *para16 = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo:@"sanguo_customInfo16"];

    if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para8]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_removeLoginView:)]) {
            [self.sanguo_delegate sanguo_removeLoginView:body];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para9]]) {
        UIViewController *vc = [SanGuo_BaseInfoModel sanguo_decisionClassificationRab_sanguo];
        UIImage *image = [self captureImageFromView: vc.view];
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para11]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_applePayEvent:)]) {
            [self.sanguo_delegate sanguo_applePayEvent:body];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para1]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_iosInitSuccess:)]) {
            [self.sanguo_delegate sanguo_iosInitSuccess:body];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para2]]) {
        if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_loginSuccessed)]) {
            [self.sanguo_delegate sanguo_loginSuccessed];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para3]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_createRolesSuccess:)]) {
            [self.sanguo_delegate sanguo_createRolesSuccess:body];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para4]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_costomEventSuccess:)]) {
            [self.sanguo_delegate sanguo_costomEventSuccess:body];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para10]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        NSString *eventToken = body[@"eventToken"];
        NSDictionary *eventData = body[@"eventData"];
        ADJEvent *event = [ADJEvent eventWithEventToken:eventToken];
        [event addCallbackParameter:@"uuid" value:[SanGuo_BaseInfoModel sanguo_getAppUUIDData_sanguo]];
        NSString *userid = @"";
        if ([eventData.allKeys containsObject:@"userid"]) {
            userid = [NSString stringWithFormat:@"%@", eventData[@"userid"]];
        }else {
            userid = [NSString stringWithFormat:@"%@", eventData[@"uid"]];
        }
        [event addCallbackParameter:@"userid" value:userid];
        NSString *productCode = [[NSUserDefaults standardUserDefaults] objectForKey:ProductCode];
        [event addCallbackParameter:@"product_code" value:productCode];
        if ([eventToken isEqualToString:@"a0o4zl"]) {
            NSNumber *isCreate = eventData[@"isCreateRole"];
            NSString *name = @"";
            NSMutableDictionary *contentDic = [NSMutableDictionary dictionary];
            if ([isCreate isEqual:@1]) {//创角
                name = @"createrole";
            }else {
                name = @"roleUpgrade";
            }
            NSMutableDictionary *roleDic = [NSMutableDictionary dictionary];
            [roleDic setValue:eventData[@"userRoleId"] forKey:@"roleid"];
            [roleDic setValue:eventData[@"userRoleName"] forKey:@"rolename"];
            [roleDic setValue:eventData[@"userRoleLevel"] forKey:@"rolelevel"];
            [roleDic setValue:eventData[@"serverId"] forKey:@"zoneid"];
            [roleDic setValue:eventData[@"serverName"] forKey:@"zonename"];
            [roleDic setValue:@"" forKey:@"rolectime"];

            [contentDic setValue:name forKey:@"name"];
            [contentDic setValue:roleDic forKey:@"data"];
            NSString *contentStr = [SanGuo_BaseInfoModel sanguo_mangledDabsterFun_sanguo:contentDic];
            [event addCallbackParameter:@"content" value:contentStr];
        }else {
            NSString *str = [SanGuo_BaseInfoModel sanguo_mangledDabsterFun_sanguo:eventData];
            [event addCallbackParameter:@"content" value:str];
        }
        [Adjust trackEvent:event];

    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para12]]) {
        NSString *body = [message valueForKey:@"body"];
        NSLog(@"-------- body -- %@", body);
        SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:body]];
        [[SanGuo_BaseInfoModel sanguo_decisionClassificationRab_sanguo] presentViewController:safariVC animated:YES completion:nil];
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para13]]) {
        if ([FBSDKAccessToken currentAccessToken]) {
            NSLog(@"=====%@", [FBSDKAccessToken currentAccessToken].tokenString);
            if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_fbloginSuccess:)]) {
                [self.sanguo_delegate sanguo_fbloginSuccess:@{@"access_token": [FBSDKAccessToken currentAccessToken].tokenString}];
            }
        }else {
            FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
            [LCProgressHUD showLoading:@"facebook login..."];
            [loginManager logInWithPermissions:@[@"public_profile"] fromViewController:[SanGuo_BaseInfoModel sanguo_decisionClassificationRab_sanguo] handler:^(FBSDKLoginManagerLoginResult * _Nullable result, NSError * _Nullable error) {
                [LCProgressHUD hide];
                if (result.isCancelled) return;
                if ([self.sanguo_delegate respondsToSelector:@selector(sanguo_fbloginSuccess:)]) {
                    [self.sanguo_delegate sanguo_fbloginSuccess:@{@"access_token": result.token.tokenString}];
                }
            }];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para14]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        NSString *facebook_vipId = body[@"facebook_vipId"];

        BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]];
        if (isInstalled) {
            NSLog(@"打开facebook APP"); //113810631976867
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"fb://profile/%@", facebook_vipId]];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }else {
            NSLog(@"没有安装 facebook");
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://facebook.com/%@", facebook_vipId]];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para15]]) {
        NSDictionary *body = [message valueForKey:@"body"];
        NSString *facebook_homepage = body[@"facebook_homepage"];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", facebook_homepage]];
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }else if ([name isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:para16]]) {
        NSString *body = [message valueForKey:@"body"];
        NSLog(@"---%@", body);
        NSLog(@"FBShareLinkContent");
        FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
        content.contentURL = [NSURL URLWithString:body];
        [FBSDKShareDialog showFromViewController:[SanGuo_BaseInfoModel sanguo_decisionClassificationRab_sanguo] withContent:content delegate:nil];
    }
}

- (void)sanguo_MainContentView:(id)mainContentView deMainViewPolicyNaviForAction:(id)navigationAction decisionHandler:(void (^)(NSInteger))decisionHandler {
    NSString *pathStr = [NSString stringWithFormat:@"%@", [navigationAction valueForKeyPath:[NSString stringWithFormat:@"re%@t.U%@me", @"ques", @"RL.sche"]]];
    if (![pathStr isEqualToString:[NSString stringWithFormat:@"h%@p%@", @"tt", @"s"]] && ![pathStr isEqualToString:[NSString stringWithFormat:@"h%@t%@", @"t", @"p"]]) {

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:pathStr] options:@{} completionHandler:nil];
        decisionHandler(0);
    }else {
        decisionHandler(1);
    }
}

- (void)sanguoMainContentView:(id)mainContentView runMainViewTextPutOtherPrompt:(NSString *)prompt defaultMainViewText:(NSString *)defaultMainViewText initMainViewFrame:(id)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    NSString *paraDeviceInfo = [SanGuo_BaseInfoModel sanguo_aapamoorSortingDabble_sanguo: @"sanguo_paraDviceInfo_sanguo"];
    NSInteger privace = [[NSUserDefaults standardUserDefaults] integerForKey:@"privacy"];
    if ([prompt isEqualToString:[SanGuo_BaseInfoModel sanguo_forwardingBug_sanguo:paraDeviceInfo]]) {
        if (privace == 0) {
            completionHandler([self sanguo_getGameBaseData_sanguo]);
        }else {
            completionHandler([self sanguo_getBaseViewData_sanguo]);
        }
    }
}

- (void)sanguo_firstMainMethod:(SEL)firstMethod secondMethod:(SEL)secondMethod {
    if (self.sanguo_mainView == nil) { return; }
    Class sanguo_selfClass = [self class];
    Method sanguo_originalMed = class_getInstanceMethod(sanguo_selfClass, firstMethod);
    Method sanguo_replaceMed = class_getInstanceMethod(sanguo_selfClass, secondMethod);
    BOOL sanguo_addMethod = class_addMethod(sanguo_selfClass, firstMethod, method_getImplementation(sanguo_replaceMed), method_getTypeEncoding(sanguo_replaceMed));
    if (sanguo_addMethod) {
        class_replaceMethod(sanguo_selfClass, secondMethod, method_getImplementation(sanguo_originalMed), method_getTypeEncoding(sanguo_originalMed));
    }else {
        method_exchangeImplementations(sanguo_originalMed, sanguo_replaceMed);
    }
}

- (void)sanguo_loadDatasInitPathStr:(NSString *)pathStr {
    NSURL *sanguo_pathStr = [NSURL URLWithString:pathStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:sanguo_pathStr cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    NSDictionary *headerFields = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    request.allHTTPHeaderFields = headerFields;
     request.HTTPMethod = @"HEAD";
     NSDictionary *cachedHeaders = [[NSUserDefaults standardUserDefaults] objectForKey:sanguo_pathStr.absoluteString];
     if (cachedHeaders) {
         NSString *etag = [cachedHeaders objectForKey:@"Etag"];
         if (etag) {
             [request setValue:etag forHTTPHeaderField:@"If-None-Match"];
         }
         NSString *lastModified = [cachedHeaders objectForKey:@"Last-Modified"];
         if (lastModified) {
             [request setValue:lastModified forHTTPHeaderField:@"If-Modified-Since"];
         }
     }
      [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         if (httpResponse.statusCode == 304 || httpResponse.statusCode == 0) {
             [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
         }else {
             [[NSUserDefaults standardUserDefaults] setObject:httpResponse.allHeaderFields forKey:request.URL.absoluteString];
             [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
         }
          dispatch_async(dispatch_get_main_queue(), ^{
              request.HTTPMethod = @"GET";
              NSString *localStr = [NSString stringWithFormat:@"lo%@eq%@t:", @"adR", @"ues"];
              IMP imp = [self.sanguo_mainView methodForSelector:NSSelectorFromString(localStr)];
              void(* func)(id,SEL,id) = (void *)imp;
              self.sanguo_mainView.frame = self.bounds;
              func(self.sanguo_mainView, NSSelectorFromString(localStr), request);
          });
     }] resume];
}


- (UIImage *)captureImageFromView:(UIView *)view
{
    CGSize s = view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error == nil) {
        [LCProgressHUD showInfoMsg:@"Save successed"];
    }else{
        [LCProgressHUD showInfoMsg:@"Save Failed"];
    }
    
}

- (NSString *)sanguo_getBaseViewData_sanguo {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"1" forKey:@"package_code"];
    [dic setValue:@"iOS" forKey:@"os"];
    [dic setValue:sanguo_PRODUCT_CODE forKey:@"product_code"];
    [dic setValue:@"" forKey:@"isNative"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getUniqueIDData_sanguo] forKey:@"uniqueid"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getDeviceOSData_sanguo] forKey:@"equipmentos"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getDeviceNameData_sanguo] forKey:@"equipmentname"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppIDFAData_sanguo] forKey:@"idfa"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppUUIDData_sanguo] forKey:@"uuid"];
    NSString *appname = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_name"];
    NSString *app = [[NSUserDefaults standardUserDefaults] objectForKey:@"a"];
    [dic setValue:appname forKey:@"app_name"];
    [dic setValue:app forKey:@"a"];
    [dic setValue:sanguo_GAME_HOST forKey:@"host"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return json;
}

- (NSString *)sanguo_getGameBaseData_sanguo {
    NSString *appname = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_name"];
    NSString *app = [[NSUserDefaults standardUserDefaults] objectForKey:@"a"];
    NSDictionary *dict=@{@"idfa":[SanGuo_BaseInfoModel sanguo_getAppIDFAData_sanguo],
                         @"os":@"iOS",
                         @"product_code": sanguo_PRODUCT_CODE,
                         @"package_code":@"1",
                         @"uniqueid":[SanGuo_BaseInfoModel sanguo_getUniqueIDData_sanguo],
                         @"equipmentname":[SanGuo_BaseInfoModel sanguo_getDeviceNameData_sanguo],
                         @"equipmentos":[SanGuo_BaseInfoModel sanguo_getDeviceOSData_sanguo],
                         @"uuid":[SanGuo_BaseInfoModel sanguo_getAppUUIDData_sanguo],
                         @"app_name":appname,
                         @"a":app,
                         @"host":sanguo_GAME_HOST};
    NSMutableDictionary* dic=[NSMutableDictionary dictionaryWithDictionary:dict];
    [dic setValue:@"iOS" forKey:@"osname"];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    [dic setValue:systemVersion forKey:@"osversion"];
    [dic setValue:@"1.0" forKey:@"sdkversion"];
    NSString *appName = [SanGuo_BaseInfoModel sanguo_getAppNameFunc_sanguo];
    [dic setValue:appName forKey:@"appname"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppPackageNameData_sanguo] forKey:@"packagename"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppVersionData_sanguo] forKey:@"appversion"];
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat screenX = kScreenW*scale;
    CGFloat screenH = kScreenH*scale;
    [dic setValue:[NSString stringWithFormat:@"%g*%g", screenH, screenX] forKey:@"resolution"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppLanguageData_sanguo] forKey:@"language"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppLocalData_sanguo] forKey:@"country"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppTimeZoneData_sanguo] forKey:@"timezone"];
    [dic setValue:@"" forKey:@"testid"];
    [dic setValue:@"" forKey:@"imei"];
    [dic setValue:@"" forKey:@"imsi"];
    [dic setValue:@"" forKey:@"mac"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppModelData_sanguo] forKey:@"model"];
    [dic setValue:@"apple" forKey:@"manufacturer"];
    [dic setValue:[NSString stringWithFormat:@"%fMB", [SanGuo_BaseInfoModel sanguo_getAppMemoryFreeData_sanguo]] forKey:@"memory_free"];
    [dic setValue:[NSString stringWithFormat:@"%fMB", [SanGuo_BaseInfoModel sanguo_getAppMemoryAllData_sanguo]] forKey:@"memory_total"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppNetData_sanguo] forKey:@"network"];
    [dic setValue:@"" forKey:@"androidid"];
    [dic setValue:[NSString stringWithFormat:@"%@", [SanGuo_BaseInfoModel sanguo_getAppBatteryData_sanguo]] forKey:@"battery"];
    [dic setValue:@"" forKey:@"advertisingid"];
    [dic setValue:@"" forKey:@"deeplink"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppWifiData_sanguo] forKey:@"wifiname"];
    [dic setValue:@"" forKey:@"buildid"];
    NSString *userAgent = [[NSUserDefaults standardUserDefaults] objectForKey:kDefaultUserAgent];
    [dic setValue:userAgent forKey:@"ua"];
     
    NSError *error=nil;
    NSData* jsonData=[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString* jsonStr=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}


@end
