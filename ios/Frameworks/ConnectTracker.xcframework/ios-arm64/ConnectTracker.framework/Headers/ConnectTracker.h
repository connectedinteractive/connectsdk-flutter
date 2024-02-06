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
