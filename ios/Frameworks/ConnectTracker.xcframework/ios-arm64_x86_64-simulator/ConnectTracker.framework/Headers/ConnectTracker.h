//
//  ConnectTracker.h
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SCNetworkReachability.h"
#import "CI_Notification.h"
#import "ConnectTrackerOptions.h"
#import "ConnectTrackerConstants.h"

@interface ConnectTracker : NSObject

+(void)init:(ConnectTrackerOptions*)connectTrackerOptions;

+(void)init:(NSString *)appKey andDelegate:(NSObject *)delegate __deprecated_msg("As of release 1.8.0, replaced by init[ConnectTrackerOptions].");
+(void)init:(NSDictionary *)launchOptions withAppKey:(NSString *)appKey andDelegate:(NSObject *)delegate withPushNotifications:(BOOL)useNotifications __deprecated_msg("As of release 1.8.0, replaced by init[ConnectTrackerOptions].");
+(void)init:(NSDictionary *)launchOptions withAppKey:(NSString *)appKey andDelegate:(NSObject *)delegate withClosure:(NotifcationBlock)closure __deprecated_msg("As of release 1.8.0, replaced by init[ConnectTrackerOptions].");

+(void)initWithLocationServices:(NSString *)appKey __deprecated_msg("As of release 1.8.0, replaced by init[ConnectTrackerOptions].");
+(void)initWithLocationServices:(NSDictionary *)launchOptions withAppKey:(NSString *)appKey withPushNotifications:(BOOL)useNotifications __deprecated_msg("As of release 1.8.0, replaced by init[ConnectTrackerOptions].");
+(void)initWithLocationServices:(NSDictionary *)launchOptions withAppKey:(NSString *)appKey withClosure:(NotifcationBlock)closure __deprecated_msg("As of release 1.8.0, replaced by init[ConnectTrackerOptions].");

+(void)onLocationPermissionGranted;
+(void)onLocationPermissionDenied;
+(void)onWillRequestLocationPermission;
+(void)applicationDidEnterBackground;

+(void)requestAppTrackingPermissionWithCompletion: (void(^)(NSUInteger status))completion;

+(bool)hasLocationPermission;
+(bool)needsAppTrackingPermission;

+(BOOL)trackEvents:(NSArray *)events;
+(BOOL)trackEvents:(NSString *)event withValue:(NSString *)value;
+(BOOL)trackEvent:(NSString *)event withValue:(NSString *)value;

// Push notification methods
+(void)registerForNotification:(NSData *)devToken;
+ (void)didReceiveRemoteNotification:(UIApplication*)application withUserInfo:(NSDictionary *)userInfo;
+ (void)handleNotification:(NSDictionary *)userInfo;

// Deeplinking methods
+(void)appWillOpenUrl:(NSURL*) url;
+(void)linkResolution:(NSURL*) url urlSuffixArray:(NSArray*) urlSuffixArray;

// Enable/Disable SDK
+(void)turnOnTracking;
+(void)turnOffTracking;
+(BOOL)isTrackingOn;
+(BOOL)isInitialized;

// Delete user data
+(void)deleteUserData;
@end
