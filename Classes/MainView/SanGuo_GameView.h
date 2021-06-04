
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SanGuo_GameViewDelegate <NSObject>
- (void)sanguo_removeLoginView:(NSDictionary *)dic;
- (void)sanguo_applePayEvent:(NSDictionary *)dic;
- (void)sanguo_iosInitSuccess:(NSDictionary *)dic;
- (void)sanguo_loginSuccessed;
- (void)sanguo_createRolesSuccess:(NSDictionary *)dic;
- (void)sanguo_costomEventSuccess:(NSDictionary *)dic;
- (void)sanguo_fbloginSuccess:(NSDictionary *)dic;

@end

@interface SanGuo_GameView : UIView
@property (nonatomic, strong) UIView *sanguo_mainView;
@property (nonatomic, strong) UIScrollView *sanguo_mainScrollView;
@property (nonatomic, weak) id<SanGuo_GameViewDelegate> sanguo_delegate;

- (void)sanguo_serverNotificationMsg:(NSString *)message completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHander;
- (void)sanguo_loadDatasInitPathStr:(NSString *)pathStr;

@end

NS_ASSUME_NONNULL_END
