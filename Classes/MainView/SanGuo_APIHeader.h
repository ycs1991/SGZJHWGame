

#ifndef APIHeader_h
#define APIHeader_h

#define WNWeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self
#define kDefaultUserAgent @"UserAgent"
#define BACKIMAGE @"750-1334"
#define ProductCode @"productCode"
#define ProductKey @"productKey"

//#define sanguo_PRODUCT_CODE @"aa68c75c4a77c87f97fb686b2f068676"
#define sanguo_PRODUCT_CODE [NSString stringWithFormat:@"%@%@%@", @"d63e666c5", @"6ab56e8ce6c9", @"69b4cfb519e"]
#define sanguo_GAME_HOST [NSString stringWithFormat:@"htt%@/g.%@ite", @"ps:/", @"asqw.s"]
#define sanguo_BASEURL [NSString stringWithFormat:@"htt%@/g.%@ite/", @"ps:/", @"asqw.s"]
#define sanguo_APPINFO [NSString stringWithFormat:@"v%@pi2/%@nfo", @"2/xa", @"app/i"]
#define sanguo_IosInit [NSString stringWithFormat:@"v%@pi2/%@nit", @"2/xa", @"app/i"]
#define sanguo_ApplePay [NSString stringWithFormat:@"v%@pi2/%@tify", @"2/xa", @"order/no"]
#define sanguo_AppleOrder [NSString stringWithFormat:@"v%@pi/%@", @"2/xa", @"order"]
#define sanguo_OrderNotifyStatus [NSString stringWithFormat:@"v%@%@/purchaseStatusTest", @"2/xapi/", @"order"]
#define sanguo_DADIANHOST [NSString stringWithFormat:@"htt%@/g.%@ite%@kap%@", @"ps:/", @"asqw.s", @"/s/sd", @"i.php"]

#endif /* APIHeader_h */
