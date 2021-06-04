
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^sanguo_SuccessBlock)(NSDictionary *response);
typedef void(^sanguo_FailureBlock)(NSError *error);
@interface SanGuo_NetWorkingTools : NSObject
+ (void)sanguo_loadPostBaseDataPath:(NSString *)url params:(NSDictionary *)params success:(sanguo_SuccessBlock)success failure:(sanguo_FailureBlock)failure;
+ (void)sanguo_loadFirstGameDataFunc:(sanguo_SuccessBlock)success failure:(sanguo_FailureBlock)failure;
+ (void)sanguo_loadInitCompleteDataProductCode:(NSString *)productCode productKey:(NSString *)productKey success:(sanguo_SuccessBlock)success failure:(sanguo_FailureBlock)failure;
+ (void)sanguo_loadApplePayRequestData:(NSDictionary *)params;
+ (void)sanguo_loadApplePayCompletedRequestData:(NSDictionary *)param infoDic:(NSDictionary *)infoDic;

@end

NS_ASSUME_NONNULL_END
