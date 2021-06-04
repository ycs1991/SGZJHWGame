
#import "SanGuo_NetWorkingTools.h"
#import <AFNetworking.h>
#import "SanGuo_BaseInfoModel.h"
#import "SanGuo_APIHeader.h"
#import "SanGuo_AESDataTools.h"
#import "SanGuo_ApplePayModel.h"
#import <StoreKit/StoreKit.h>
#import "SanGuo_EncodeDataModel.h"
#import "LCProgressHUD.h"
#import "SanGuo_DataDotTools.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <GoogleAnalytics/GAI.h>
//#import <GoogleAnalytics/GAIDictionaryBuilder.h>
#import <Firebase/Firebase.h>

@implementation SanGuo_NetWorkingTools
+ (void)sanguo_loadPostBaseDataPath:(NSString *)url params:(NSDictionary *)params success:(sanguo_SuccessBlock)success failure:(sanguo_FailureBlock)failure {
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"text/html", @"application/json", nil];
    [manager POST:url parameters:params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
        NSString *returnCode = @"";
        if ([[responseObject objectForKey:@"code"] isKindOfClass:[NSString class]]) {
            returnCode = [responseObject objectForKey:@"code"];
        }else {
            returnCode = [[responseObject objectForKey:@"code"] stringValue];
        }
        if ([returnCode isEqualToString:@"0"]) {
            NSDictionary *data = [responseObject valueForKey:@"data"];
            success(data);
        }else {
//            [LCProgressHUD showFailure:responseObject[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
+ (NSMutableDictionary *)sanguo_publicParams {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"" forKey:@"packet_code"];
    [dic setValue:@"iOS" forKey:@"android"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppIDFAData_sanguo] forKey:@"distinctid"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getDeviceOSData_sanguo] forKey:@"deviceos"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getDeviceNameData_sanguo] forKey:@"devicename"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppIDFAData_sanguo] forKey:@"idsf"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppVersionData_sanguo] forKey:@"release"];
    [dic setValue:@"" forKey:@"cam"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppUUIDData_sanguo] forKey:@"umid"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getCurrentTimeData_sanguo] forKey:@"when"];
    return dic;
}
+ (void)sanguo_loadFirstGameDataFunc:(sanguo_SuccessBlock)success failure:(sanguo_FailureBlock)failure {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:sanguo_PRODUCT_CODE forKey:@"product_code"];
    NSString *jsonStr = [SanGuo_BaseInfoModel sanguo_mangledDabsterFun_sanguo:dic];
    NSString *encryptStr = [SanGuo_AESDataTools sanguo_getDataPlainTextFunc_sanguo:jsonStr];
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    [paras setValue:encryptStr forKey:@"p"];
    [paras setValue:[SanGuo_BaseInfoModel sanguo_getAppBundleVersionData_sanguo] forKey:@"version"];
    [paras setValue:@"2" forKey:@"v"];
    NSString *urlPath = [NSString stringWithFormat:@"%@%@", sanguo_BASEURL, sanguo_APPINFO];
    [self sanguo_loadPostBaseDataPath:urlPath params:paras success:^(NSDictionary * _Nonnull response) {
        success(response);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)sanguo_loadInitCompleteDataProductCode:(NSString *)productCode productKey:(NSString *)productKey success:(sanguo_SuccessBlock)success failure:(sanguo_FailureBlock)failure {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:sanguo_PRODUCT_CODE forKey:@"product_code"];
    NSString *signStr = [SanGuo_BaseInfoModel sanguo_signDataForDict:dic];
    NSString *signProductKeyStr = [NSString stringWithFormat:@"%@%@", signStr, productKey];
    NSString *signMD5Str = [SanGuo_BaseInfoModel sanguo_getMD5Data_sanguo:signProductKeyStr];
    [dic setValue:signMD5Str forKey:@"flag"];

    NSString *jsonStr = [SanGuo_BaseInfoModel sanguo_mangledDabsterFun_sanguo:dic];
    NSString *encryptStr = [SanGuo_AESDataTools sanguo_getDataPlainTextFunc_sanguo:jsonStr];
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    [paras setValue:encryptStr forKey:@"p"];
    NSString *urlPath = [NSString stringWithFormat:@"%@%@", sanguo_BASEURL, sanguo_IosInit];
    [self sanguo_loadPostBaseDataPath:urlPath params:paras success:^(NSDictionary * _Nonnull response) {
        success(response);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)sanguo_loadApplePayRequestData:(NSDictionary *)params {
    NSString *productID = params[@"product_id"];
    NSString *order_num = params[@"order_num"];

//    [self sanguo_loadApplePayStatusRequestData:order_num];

    [[SanGuo_ApplePayModel sanguo_characterCropShareFun] sanguo_nextNavigatePaymentFun:productID quantity:1 sanguo_sendOrder:order_num];
}

+ (void)sanguo_loadApplePayCompletedRequestData:(NSDictionary *)param infoDic:(NSDictionary *)infoDic {
    NSString *productID = param[@"productId"];
    NSString *tid = param[@"tid"];
    SKPaymentTransaction *transaction = param[@"transaction"];
    NSData *encodeData = [self sanguo_triggerElementReceiptFun:transaction];
    NSData *baseData = [SanGuo_EncodeDataModel sanguo_efficientInteroperabilityEap_sanguo:encodeData];
    NSString *jsonStr = [[NSString alloc] initWithData:baseData encoding:NSUTF8StringEncoding];

    NSDictionary *dic = [self sanguo_publicParams];
    [dic setValue:infoDic[@"open_id"] forKey:@"open_id"];
    [dic setValue:infoDic[@"product_code"] forKey:@"product_code"];
    [dic setValue:productID forKey:@"product_id"];
    [dic setValue:infoDic[@"pay_channel"] forKey:@"pay_channel"];
    [dic setValue:infoDic[@"currency"] forKey:@"currency"];
    [dic setValue:infoDic[@"money"] forKey:@"money"];
    [dic setValue:infoDic[@"user_currency"] forKey:@"user_currency"];
    [dic setValue:infoDic[@"user_money"] forKey:@"user_money"];
    [dic setValue:infoDic[@"order_num"] forKey:@"order_num"];
    [dic setValue:tid forKey:@"transaction_id"];
    [dic setValue:jsonStr forKey:@"payload"];

    NSString *product_key = [[NSUserDefaults standardUserDefaults] objectForKey:ProductKey];
    NSString *signStr = [SanGuo_BaseInfoModel sanguo_signDataForDict:dic];
    NSString *signProductKeyStr = [NSString stringWithFormat:@"%@%@", signStr, product_key];
    NSString *signMD5Str = [SanGuo_BaseInfoModel sanguo_getMD5Data_sanguo:signProductKeyStr];
    [dic setValue:signMD5Str forKey:@"flag"];

    NSString *urlPath = [NSString stringWithFormat:@"%@%@", sanguo_BASEURL, sanguo_ApplePay];
    NSLog(@"购买完成参数 dic --- %@", dic);
    [self sanguo_loadPostBaseDataPath:urlPath params:dic success:^(NSDictionary * _Nonnull response) {
        NSLog(@"购买完成回调 ==== %@", response);
        [LCProgressHUD showSuccess:@"Purchase completed, please check"];
        if ([response.allKeys containsObject:@"upload_status"]) {
            if ([response[@"upload_status"] isEqual:@1]) {
                NSString *money = response[@"money"];
                [FBSDKAppEvents logPurchase:money.doubleValue currency:response[@"currency"]];
            }
        }
    } failure:^(NSError * _Nonnull error) {
        [LCProgressHUD showFailure:error.localizedDescription];
    }];
}

+ (void)sanguo_loadApplePayStatusRequestData:(NSString *)orderNum {

    NSDictionary *dic = [self sanguo_publicParams];
    [dic setValue:orderNum forKey:@"order_num"];
    [dic setValue:[SanGuo_BaseInfoModel sanguo_getAppIDFAData_sanguo] forKey:@"idsf"];

    NSString *urlPath = [NSString stringWithFormat:@"%@%@", sanguo_BASEURL, sanguo_OrderNotifyStatus];
    NSLog(@"==== dic ===  %@", dic);
    NSLog(@"------ urlPath --- %@", urlPath);
    [self sanguo_loadPostBaseDataPath:urlPath params:dic success:^(NSDictionary * _Nonnull response) {
        NSLog(@"status ==== %@", response);
        if ([response.allKeys containsObject:@"upload_status"]) {
            if ([response[@"upload_status"] isEqual:@1]) {
                NSLog(@"11111111111");
//                [self logApplePayEvent:response[@"order_num"] event_time:response[@"event_time"] product_name:response[@"product_name"] product_id:response[@"product_id"] currency:response[@"currency"] money:response[@"money"] quantity:response[@"quantity"] package_name:response[@"package_name"] bundle_id:response[@"bundle_id"]];
//                NSDictionary *dic = @{@"value": response[@"money"], @"currency": response[@"currency"]};
//                [FBSDKAppEvents
//                 logEvent:@"Purchase"
//                 parameters:dic];
                NSString *money = response[@"money"];
                [FBSDKAppEvents logPurchase:money.doubleValue currency:response[@"currency"]];

                [self firebaseAnalyticsCurrency:response[@"currency"] product_id:response[@"order_num"] productName:response[@"product_name"] price:response[@"money"]];
            }
        }
    } failure:^(NSError * _Nonnull error) {
        [LCProgressHUD showFailure:error.localizedDescription];
    }];
}


+ (void)firebaseAnalyticsCurrency:(NSString *)currency product_id:(NSString *)product_id productName:(NSString *)productName price:(NSString *)price {

    NSLog(@"22222222222");

    // Prepare purchase params
    NSMutableDictionary *purchaseParams = [@{
      kFIRParameterCurrency: currency,
    } mutableCopy];

    NSMutableDictionary *jeggings = [@{
      kFIRParameterItemID: product_id,
      kFIRParameterItemName: productName,
      kFIRParameterPrice: price,
    } mutableCopy];

    // Add items
    purchaseParams[kFIRParameterItems] = @[jeggings];

    // Log purchase event
    [FIRAnalytics logEventWithName:kFIREventPurchase parameters:purchaseParams];

}

/**
 * For more details, please take a look at:
 * developers.facebook.com/docs/reference/ios/current/class/FBSDKAppEvents
 */
+ (void)logApplePayEvent:(NSString *)order_num
    event_time:(NSString *)event_time
    product_name:(NSString *)product_name
    product_id:(NSString *)product_id
    currency:(NSString *)currency
    money:(NSString *)money
    quantity:(NSString *)quantity
    package_name:(NSString *)package_name
    bundle_id:(NSString *)bundle_id {
    NSDictionary *params =
    @{
      @"order_num" : order_num,
      @"event_time" : event_time,
      @"product_name" : product_name,
      @"product_id" : product_id,
      @"currency" : currency,
      @"money" : money,
      @"quantity" : quantity,
      @"package_name" : package_name,
      @"bundle_id" : bundle_id
      };
    [FBSDKAppEvents
     logEvent:@"FBApplePayEvent"
     parameters:params];
}


+ (NSData *)sanguo_triggerElementReceiptFun:(id)payment
{
    NSData *data = nil;
    if ([payment isKindOfClass:[SKPaymentTransaction class]]) {
//        SKPaymentTransaction *pay = (SKPaymentTransaction *)payment;
//        data = pay.transactionReceipt;
        NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
        data = [NSData dataWithContentsOfURL:receiptURL];
    }
    return data;
}
@end
