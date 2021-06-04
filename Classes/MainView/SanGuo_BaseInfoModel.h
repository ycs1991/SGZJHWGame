#import <Foundation/Foundation.h>
#import <AdSupport/ASIdentifierManager.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SanGuo_BaseInfoModel : NSObject
+ (NSString *)sanguo_getAppVersionData_sanguo;
+ (NSString *)sanguo_getAppBundleVersionData_sanguo;
+ (NSString *)sanguo_getAppPackageNameData_sanguo;
+ (NSString *)sanguo_getAppNameFunc_sanguo;
+ (NSString *)sanguo_getAppUUIDData_sanguo;
+ (NSString *)sanguo_getUniqueIDData_sanguo;
+ (NSString *)sanguo_getAppIDFAData_sanguo;
+ (NSString *)sanguo_getDeviceNameData_sanguo;
+ (NSString *)sanguo_getDeviceOSData_sanguo;
+ (NSString *)sanguo_getCurrentTimeData_sanguo;
+ (NSString *)sanguo_labarumSearchFun_sanguo;
+ (NSString *)sanguo_getAppLanguageData_sanguo;
+ (NSString *)sanguo_getAppLocalData_sanguo;
+ (NSString *)sanguo_getAppTimeZoneData_sanguo;
+ (double)sanguo_getAppMemoryFreeData_sanguo;
+ (float)sanguo_getAppMemoryAllData_sanguo;
+ (NSString *)sanguo_audioEvent_sanguo;
+ (NSString *)sanguo_getAppBatteryData_sanguo;
+ (NSString *)sanguo_getAppNetData_sanguo;
+ (NSString *)sanguo_getAppWifiData_sanguo;
+ (NSString *)sanguo_aapamoorSortingDabble_sanguo:(NSString *)key;
+ (UIViewController *)sanguo_decisionClassificationRab_sanguo;
+ (NSDictionary *)sanguo_rangePart_sanguo:(NSString *)jsonString;
+ (NSString *)sanguo_getMD5Data_sanguo:(NSString *)string;
+ (BOOL)sanguo_isIphoneX_sanguo;
+ (NSString *)sanguo_getAppModelData_sanguo;
+ (NSString *)sanguo_forwardingBug_sanguo:(NSString *)base64;
+ (NSString *)sanguo_mangledDabsterFun_sanguo:(NSDictionary *)dict;
+ (NSString *)sanguo_signDataForDict:(NSDictionary *)dic;
+ (NSString *)sanguo_dictionaryToJson:(NSDictionary *)dic;

@end
NS_ASSUME_NONNULL_END
