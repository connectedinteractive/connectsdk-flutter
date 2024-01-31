//
//  CI_NotificationManager.h
//  ConnectSDK
//
//  Created by Tom Clark on 2017-06-28.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UserNotifications/UNUserNotificationCenter.h>
#import "ConnectDeviceInfo.h"

@interface CI_NotificationManager : NSObject <UNUserNotificationCenterDelegate>
- (instancetype)initWithAppKey:(NSString *)appKey;
- (void)registerForNotificationsUsingNotificationCenter;
- (void)registerForNotificationsUsingNotificationSettings;
- (void)registerWithServerForNotifications:(NSData *)devToken withDeviceInfo: (ConnectDeviceInfo*) deviceInfo;
+ (NSString *)stringWithDeviceToken:(NSData *)deviceToken;
@end
