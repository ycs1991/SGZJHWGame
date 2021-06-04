
#import <Foundation/Foundation.h>

@interface SanGuo_ApplePayModel : NSObject
@property (nonatomic,strong) NSString* sanguo_sendOrder;

- (void)sanguo_nextNavigatePaymentFun:(NSString *)productId quantity:(int)quantity sanguo_sendOrder:(NSString *)sanguo_sendOrder;

- (void)sanguo_customizeImageTransactionFun;

+ (instancetype)sanguo_characterCropShareFun;
@end
