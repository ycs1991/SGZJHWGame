#import "SanGuo_DataDotTools.h"
#import "SanGuo_BaseInfoModel.h"
#import "SanGuo_APIHeader.h"
#import <AFNetworking.h>
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height
@implementation SanGuo_DataDotTools
+ (void)sanguo_getStartGameDataFunc_sanguo{
    NSDictionary *params = [NSDictionary dictionary];
    [self sanguo_loadDotPOSTWithParams:params action:@"customevent" customevent:@"startgame"];
}

+ (void)sanguo_getActivationDataFunc_sanguo {
    NSDictionary *params = [NSDictionary dictionary];
    [self sanguo_loadDotPOSTWithParams:params action:@"activation" customevent:@""];
}

+ (void)sanguo_getCustomeData_sanguo:(NSMutableDictionary *)params customevent:(NSString *)customevent {
    NSString *currentTime = [SanGuo_BaseInfoModel sanguo_labarumSearchFun_sanguo];
    [params setValue:currentTime forKey:@"currenttime"];
    [self sanguo_loadDotPOSTWithParams:params action:@"customevent" customevent:customevent];
}
+ (void)sanguo_loadDotPOSTWithParams:(NSDictionary *)params action:(NSString *)action customevent:(NSString *)customevent {
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"text/html",nil];
    NSString *product_Key = @"BA886FF52827126DCD18E73E0E16420C";
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat screenX = kScreenW*scale;
    CGFloat screenH = kScreenH*scale;
    NSString *resolution = [NSString stringWithFormat:@"%f*%f", screenH, screenX];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:action forKey:@"action"];
        [dic setValue:sanguo_PRODUCT_CODE forKey:@"appid"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getCurrentTimeData_sanguo] forKey:@"time"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getCurrentTimeData_sanguo] forKey:@"gentime"];
    [dic setValue:@"" forKey:@"advid"];
    [dic setValue:@"iOS" forKey:@"osname"];
    NSString *userid;
    userid = [SanGuo_BaseInfoModel sanguo_getAppIDFAData_sanguo];

    [dic setValue:userid forKey:@"userid"];
    NSString *appName = [SanGuo_BaseInfoModel sanguo_getAppNameFunc_sanguo];
    [dic setValue:appName forKey:@"appname"];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];;
    [dic setValue:systemVersion forKey:@"osversion"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppVersionData_sanguo] forKey:@"sdkversion"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppPackageNameData_sanguo] forKey:@"packagename"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppBundleVersionData_sanguo] forKey:@"appversion"];
    [dic setValue:resolution forKey:@"resolution"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppLanguageData_sanguo] forKey:@"language"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppLocalData_sanguo] forKey:@"country"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppTimeZoneData_sanguo] forKey:@"timezone"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppUUIDData_sanguo] forKey:@"uuid"];
    [dic setValue:@"" forKey:@"testid"];
    NSString *signStr = [SanGuo_BaseInfoModel sanguo_signDataForDict:dic];
    NSString *signProductKeyStr = [NSString stringWithFormat:@"%@%@", signStr, product_Key];
    NSString *signMD5Str = [SanGuo_BaseInfoModel sanguo_getMD5Data_sanguo:signProductKeyStr];
    [dic setValue:signMD5Str forKey:@"sign"];
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionary];
    [infoDic setObject:[SanGuo_BaseInfoModel sanguo_getAppIDFAData_sanguo] forKey:@"idfa"];
    [infoDic setObject:@"" forKey:@"imei"];
    [infoDic setObject:@"" forKey:@"imsi"];
    [infoDic setObject:@"" forKey:@"mac"];
    [infoDic setObject:[SanGuo_BaseInfoModel sanguo_getAppModelData_sanguo] forKey:@"model"];
    [infoDic setObject:[SanGuo_BaseInfoModel sanguo_getAppPackageNameData_sanguo] forKey:@"buildid"];
    [infoDic setObject:@"" forKey:@"manufacturer"];
    NSString *memory_free = [NSString stringWithFormat:@"%fMB", [SanGuo_BaseInfoModel sanguo_getAppMemoryFreeData_sanguo]];
    [infoDic setObject:memory_free forKey:@"memory_free"];
    NSString *total = [NSString stringWithFormat:@"%fMB", [SanGuo_BaseInfoModel sanguo_getAppMemoryAllData_sanguo]];
    [infoDic setObject:total forKey:@"memory_total"];
    [infoDic setObject:[SanGuo_BaseInfoModel sanguo_getAppNetData_sanguo] forKey:@"network"];
    [infoDic setObject:[NSString stringWithFormat:@"%@", [SanGuo_BaseInfoModel sanguo_getAppBatteryData_sanguo]] forKey:@"battery"];
    [infoDic setObject:@"" forKey:@"androidid"];
    [infoDic setObject:@"" forKey:@"advertisingid"];
    [infoDic setObject:@"" forKey:@"deeplink"];
    [infoDic setObject:[SanGuo_BaseInfoModel sanguo_getAppWifiData_sanguo] forKey:@"wifiname"];
    [dic setObject:infoDic forKey:@"info"];
    if ([action isEqualToString:@"activation"] || [action isEqualToString:@"login"] || [action isEqualToString:@"register"] || [action isEqualToString:@"forground"] || [action isEqualToString:@"heartbeat"] || [action isEqualToString:@"startgame"]) {
        [dic setObject:@"" forKey:@"content"];
    }else if ([action isEqualToString:@"customevent"]) {
        NSMutableDictionary *contentDic = [NSMutableDictionary dictionary];
        [contentDic setObject:customevent forKey:@"name"];
        NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
        if ([customevent isEqualToString:@"createRole"]) {
            NSDictionary *roleDic = params;
            if ([roleDic[@"isCreateRole"]boolValue] ) {
                [contentDic setObject:@"createrole" forKey:@"name"];
            }else {
                [contentDic setObject:@"roleUpgrade" forKey:@"name"];
            }
            [dataDic setObject:roleDic[@"userRoleId"] forKey:@"roleid"];
            [dataDic setObject:roleDic[@"userRoleName"] forKey:@"rolename"];
            [dataDic setObject:roleDic[@"userRoleLevel"] forKey:@"rolelevel"];
            [dataDic setObject:roleDic[@"serverId"] forKey:@"zoneid"];
            [dataDic setObject:roleDic[@"serverName"] forKey:@"zonename"];
            if (roleDic[@"roleCreateTime"]==nil) {
                [dataDic setObject:@"" forKey:@"rolectime"];
            }else{
                [dataDic setObject:roleDic[@"roleCreateTime"] forKey:@"rolectime"];
            }
            [contentDic setObject:dataDic forKey:@"data"];
        }else {
            [contentDic setObject:params forKey:@"data"];
        }
        [dic setObject:contentDic forKey:@"content"];
    }else {}
//    NSLog(@"dic-------%@", dic);
    [manager POST:sanguo_DADIANHOST parameters:dic headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseObject-------%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end
