//
//  CI_ConnectTrackerCore.h
//  ConnectSDK
//
//  Created by Tom Clark on 2017-02-27.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import "SCNetworkReachability.h"
#import "CI_Notification.h"
#import <UIKit/UIKit.h>
#import "ConnectTrackerCallback.h"

#import <CoreLocation/CoreLocation.h>

#ifndef CI_ConnectTrackerCore_h
#define CI_ConnectTrackerCore_h

@interface CI_ConnectTrackerCore: NSObject<CLLocationManagerDelegate>

@property bool useLocationServices;
@property (nonatomic, weak) id<ConnectTrackerCallback> connectTrackerCallback;

- (void)init:(NSString *)appKey andDelegate:(NSObject *)delegate;

- (BOOL)trackEvents:(NSArray *)events withParameters:(NSDictionary *)parameters;
- (BOOL)trackEvents:(NSString *)event withValue:(NSString *)value;

- (void)handleNotification:(NSDictionary *)userInfo;
- (void)registerForNotification:(NSData *)devToken;

- (void)onLocationPermissionGranted;
- (void)onLocationPermissionDenied;
- (void)onWillRequestLocationPermission;
- (void)applicationDidEnterBackground;

- (void)registerForNotificationsUsingNotificationCenter;
- (void)registerForNotificationsUsingNotificationSettings;

-(void)appWillOpenUrl:(NSURL*) url;
-(void)linkResolution:(NSURL*) url urlSuffixArray:(NSArray*) urlSuffixArray;

-(void)setEnable:(BOOL) enable;
-(BOOL)isEnabled;
-(BOOL)isInitialized;
-(void)deleteUserData;

@property (nonatomic) NotifcationBlock notificationBlock;

@end

#endif /* CI_ConnectTrackerCore_h */
