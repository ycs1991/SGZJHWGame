#import <UIKit/UIKit.h>
#import "SanGuo_GameView.h"
NS_ASSUME_NONNULL_BEGIN
@interface SanGuo_GameViewController : UIViewController<SanGuo_GameViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) SanGuo_GameView *sanguo_gamesBackView;
@property (nonatomic, assign) int sanguo_privaData;
@property (nonatomic, strong) UIImageView *sanguo_sendImageV;
- (void)sanguo_tapGestureLocateFunc_sanguo:(UIView *)v;
@property (nonatomic, assign) float sanguo_labelTouch;
@property (nonatomic, assign) float sanguo_xslDistance;
@property (nonatomic, strong) UIImageView *sanguo_startImageV;
@property (nonatomic, strong) NSDictionary *sanguo_appleDic;
@property (nonatomic, assign) long sanguo_userAppCLick;
@property (nonatomic, strong) NSTimer *sanguo_clickTimer;

@end
NS_ASSUME_NONNULL_END
