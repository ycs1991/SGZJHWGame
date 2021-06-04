
#import "SanGuo_KeyClainData.h"
#import <Security/Security.h>

static NSString *sanguo_HundredActualObjErrorDomain = @"sanguo_HundredActualObjErrorDomain";

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 30000 && TARGET_IPHONE_SIMULATOR
@interface SanGuoHierarchyOakmossActualObj (PrivateMethods)
+ (SecKeychainItemRef) getKeychainItemReferenceForUsername: (NSString *) sanguo_xanthineDevelop andServiceName: (NSString *) serviceName error: (NSError **) error;
@end
#endif

@implementation SanGuo_KeyClainData

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 30000 && TARGET_IPHONE_SIMULATOR

+ (NSString *) sanguo_hardMacarthurUbiquitarian_sanguo: (NSString *) sanguo_xanthineDevelop andServiceName: (NSString *) serviceName error: (NSError **) error {
	if (!sanguo_xanthineDevelop || !serviceName) {
		*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -2000 userInfo: nil];
		return nil;
	}
	
	SecKeychainItemRef item = [SanGuoHierarchyOakmossActualObj getKeychainItemReferenceForUsername: sanguo_xanthineDevelop andServiceName: serviceName error: error];
	
	if (*error || !item) {
		return nil;
	}
	
  UInt32 length;
  char *password;
  SecKeychainAttribute attributes[8];
  SecKeychainAttributeList list;
	
  attributes[0].tag = kSecAccountItemAttr;
  attributes[1].tag = kSecDescriptionItemAttr;
  attributes[2].tag = kSecLabelItemAttr;
  attributes[3].tag = kSecModDateItemAttr;
  
  list.count = 4;
  list.attr = attributes;
  
  OSStatus status = SecKeychainItemCopyContent(item, NULL, &list, &length, (void **)&password);
	
	if (status != noErr) {
		*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
		return nil;
  }
  
	NSString *passwordString = nil;
	
	if (password != NULL) {
		char sanguo_compriseBuffer[1024];
		
		if (length > 1023) {
			length = 1023;
		}
		strncpy(sanguo_compriseBuffer, password, length);
		
		sanguo_compriseBuffer[length] = '\0';
		passwordString = [NSString stringWithCString:sanguo_compriseBuffer];
	}
	
	SecKeychainItemFreeContent(&list, password);
  
  CFRelease(item);
  
  return passwordString;
}

+ (void) sanguo_adlThreadUbi_sanguo: (NSString *) sanguo_xanthineDevelop andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error {
	if (!sanguo_xanthineDevelop || !password || !serviceName) {
		*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -2000 userInfo: nil];
		return;
	}
	
	OSStatus status = noErr;
	
	SecKeychainItemRef item = [SanGuoHierarchyOakmossActualObj getKeychainItemReferenceForUsername: sanguo_xanthineDevelop andServiceName: serviceName error: error];
	
	if (*error && [*error code] != noErr) {
		return;
	}
	
	*error = nil;
	
	if (item) {
		status = SecKeychainItemModifyAttributesAndData(item,
                                                    NULL,
                                                    strlen([password UTF8String]),
                                                    [password UTF8String]);
		
		CFRelease(item);
	}
	else {
		status = SecKeychainAddGenericPassword(NULL,                                     
                                           strlen([serviceName UTF8String]), 
                                           [serviceName UTF8String],
                                           strlen([sanguo_xanthineDevelop UTF8String]),                        
                                           [sanguo_xanthineDevelop UTF8String],
                                           strlen([password UTF8String]),
                                           [password UTF8String],
                                           NULL);
	}
	
	if (status != noErr) {
		*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
	}
}

+ (void) sanguo_highOverflowFalsism_sanguo: (NSString *) sanguo_xanthineDevelop andServiceName: (NSString *) serviceName error: (NSError **) error {
	if (!sanguo_xanthineDevelop || !serviceName) {
		*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: 2000 userInfo: nil];
		return;
	}
	
	*error = nil;
	
	SecKeychainItemRef item = [SanGuoHierarchyOakmossActualObj getKeychainItemReferenceForUsername: sanguo_xanthineDevelop andServiceName: serviceName error: error];
	
	if (*error && [*error code] != noErr) {
		return;
	}
	
	OSStatus status;
	
	if (item) {
		status = SecKeychainItemDelete(item);
		
		CFRelease(item);
	}
	
	if (status != noErr) {
		*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
	}
}

+ (SecKeychainItemRef) getKeychainItemReferenceForUsername: (NSString *) sanguo_xanthineDevelop andServiceName: (NSString *) serviceName error: (NSError **) error {
	if (!sanguo_xanthineDevelop || !serviceName) {
		*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -2000 userInfo: nil];
		return nil;
	}
	
	*error = nil;
  
	SecKeychainItemRef item;
	
	OSStatus status = SecKeychainFindGenericPassword(NULL,
                                                   strlen([serviceName UTF8String]),
                                                   [serviceName UTF8String],
                                                   strlen([sanguo_xanthineDevelop UTF8String]),
                                                   [sanguo_xanthineDevelop UTF8String],
                                                   NULL,
                                                   NULL,
                                                   &item);
	
	if (status != noErr) {
		if (status != errSecItemNotFound) {
			*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
		}
		
		return nil;		
	}
	
	return item;
}

#else

+ (NSString *) sanguo_hardMacarthurUbiquitarian_sanguo: (NSString *) sanguo_xanthineDevelop andServiceName: (NSString *) serviceName error: (NSError **) error {
	if (!sanguo_xanthineDevelop || !serviceName) {
		if (error != nil) {
			*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -2000 userInfo: nil];
		}
		return nil;
	}
	
	if (error != nil) {
		*error = nil;
	}
  
	
	NSArray *keys = [[[NSArray alloc] initWithObjects: (NSString *) kSecClass, kSecAttrAccount, kSecAttrService, nil] autorelease];
	NSArray *objects = [[[NSArray alloc] initWithObjects: (NSString *) kSecClassGenericPassword, sanguo_xanthineDevelop, serviceName, nil] autorelease];
	
	NSMutableDictionary *query = [[[NSMutableDictionary alloc] initWithObjects: objects forKeys: keys] autorelease];
	
	
	NSDictionary *attributeResult = NULL;
	NSMutableDictionary *attributeQuery = [query mutableCopy];
	[attributeQuery setObject: (id) kCFBooleanTrue forKey:(id) kSecReturnAttributes];
	OSStatus status = SecItemCopyMatching((CFDictionaryRef) attributeQuery, (CFTypeRef *) &attributeResult);
	
	[attributeResult release];
	[attributeQuery release];
	
	if (status != noErr) {
		if (error != nil && status != errSecItemNotFound) {
			*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
		}
		
		return nil;
	}
	
	
	NSData *resultData = nil;
	NSMutableDictionary *passwordQuery = [query mutableCopy];
	[passwordQuery setObject: (id) kCFBooleanTrue forKey: (id) kSecReturnData];
  
	status = SecItemCopyMatching((CFDictionaryRef) passwordQuery, (CFTypeRef *) &resultData);
	
	[resultData autorelease];
	[passwordQuery release];
	
	if (status != noErr) {
		if (status == errSecItemNotFound) {
			if (error != nil) {
				*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -1999 userInfo: nil];
			}
		}
		else {
			if (error != nil) {
				*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
			}
		}
		
		return nil;
	}
  
	NSString *password = nil;
  
	if (resultData) {
		password = [[NSString alloc] initWithData: resultData encoding: NSUTF8StringEncoding];
	}
	else {
		if (error != nil) {
			*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -1999 userInfo: nil];
		}
	}
  
	return [password autorelease];
}

+ (BOOL) sanguo_adlThreadUbi_sanguo: (NSString *) sanguo_xanthineDevelop andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error
{		
	if (!sanguo_xanthineDevelop || !password || !serviceName)
  {
		if (error != nil) 
    {
			*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -2000 userInfo: nil];
		}
		return NO;
	}
	
	NSError *getError = nil;
	NSString *existingPassword = [SanGuo_KeyClainData sanguo_hardMacarthurUbiquitarian_sanguo: sanguo_xanthineDevelop andServiceName: serviceName error:&getError];
  
	if ([getError code] == -1999) 
  {
    
		getError = nil;
		
		[self sanguo_highOverflowFalsism_sanguo: sanguo_xanthineDevelop andServiceName: serviceName error: &getError];
    
		if ([getError code] != noErr) 
    {
			if (error != nil) 
      {
				*error = getError;
			}
			return NO;
		}
	}
	else if ([getError code] != noErr) 
  {
		if (error != nil) 
    {
			*error = getError;
		}
		return NO;
	}
	
	if (error != nil) 
  {
		*error = nil;
	}
	
	OSStatus status = noErr;
  
	if (existingPassword) 
  {
		
		if (![existingPassword isEqualToString:password] && updateExisting)
    {
			
			NSArray *keys = [[[NSArray alloc] initWithObjects: (NSString *) kSecClass, 
                        kSecAttrService, 
                        kSecAttrLabel, 
                        kSecAttrAccount, 
                        nil] autorelease];
			
			NSArray *objects = [[[NSArray alloc] initWithObjects: (NSString *) kSecClassGenericPassword, 
                           serviceName,
                           serviceName,
                           sanguo_xanthineDevelop,
                           nil] autorelease];
			
			NSDictionary *query = [[[NSDictionary alloc] initWithObjects: objects forKeys: keys] autorelease];			
			
			status = SecItemUpdate((CFDictionaryRef) query, (CFDictionaryRef) [NSDictionary dictionaryWithObject: [password dataUsingEncoding: NSUTF8StringEncoding] forKey: (NSString *) kSecValueData]);
		}
	}
	else 
  {
		
		NSArray *keys = [[[NSArray alloc] initWithObjects: (NSString *) kSecClass, 
                      kSecAttrService, 
                      kSecAttrLabel, 
                      kSecAttrAccount, 
                      kSecValueData, 
                      nil] autorelease];
		
		NSArray *objects = [[[NSArray alloc] initWithObjects: (NSString *) kSecClassGenericPassword, 
                         serviceName,
                         serviceName,
                         sanguo_xanthineDevelop,
                         [password dataUsingEncoding: NSUTF8StringEncoding],
                         nil] autorelease];
		
		NSDictionary *query = [[[NSDictionary alloc] initWithObjects: objects forKeys: keys] autorelease];			
    
		status = SecItemAdd((CFDictionaryRef) query, NULL);
	}
	
	if (status != noErr) 
  {
		if (error != nil) {
			*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
		}
    
    return NO;
	}
  
  return YES;
}

+ (BOOL) sanguo_highOverflowFalsism_sanguo: (NSString *) sanguo_xanthineDevelop andServiceName: (NSString *) serviceName error: (NSError **) error 
{
	if (!sanguo_xanthineDevelop || !serviceName) 
  {
		if (error != nil) 
    {
			*error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: -2000 userInfo: nil];
		}
		return NO;
	}
	
	if (error != nil) 
  {
		*error = nil;
	}
  
	NSArray *keys = [[[NSArray alloc] initWithObjects: (NSString *) kSecClass, kSecAttrAccount, kSecAttrService, kSecReturnAttributes, nil] autorelease];
	NSArray *objects = [[[NSArray alloc] initWithObjects: (NSString *) kSecClassGenericPassword, sanguo_xanthineDevelop, serviceName, kCFBooleanTrue, nil] autorelease];
	
	NSDictionary *query = [[[NSDictionary alloc] initWithObjects: objects forKeys: keys] autorelease];
	
	OSStatus status = SecItemDelete((CFDictionaryRef) query);
	
	if (status != noErr) 
  {
	  if (error != nil) {
		  *error = [NSError errorWithDomain: sanguo_HundredActualObjErrorDomain code: status userInfo: nil];
	  }
    
    return NO;
	}
  
  return YES;
}

#endif

@end
