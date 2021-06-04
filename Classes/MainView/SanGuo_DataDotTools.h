#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^sanguo_SuccessBlock)(NSDictionary *response);
typedef void(^sanguo_FailureBlock)(NSError *error);
@interface SanGuo_DataDotTools : NSObject
+ (void)sanguo_getStartGameDataFunc_sanguo;
+ (void)sanguo_getActivationDataFunc_sanguo;

+ (void)sanguo_getCustomeData_sanguo:(NSMutableDictionary *)params customevent:(NSString *)customevent;

@end
NS_ASSUME_NONNULL_END
