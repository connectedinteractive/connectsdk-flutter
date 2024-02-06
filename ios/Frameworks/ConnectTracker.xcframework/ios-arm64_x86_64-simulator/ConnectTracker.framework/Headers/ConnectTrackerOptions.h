//
//  ConnectTrackerOptions.h
//  ConnectSDK
//
//  Created by Marcelo on 2020-03-17.
//  Copyright © 2020 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CI_Notification.h"
#import "ConnectTrackerCallback.h"

@interface ConnectTrackerOptions : NSObject

@property NSString* appKey;
@property (nonatomic, weak) id<ConnectTrackerCallback> connectTrackerCallback;
@property NotifcationBlock notificationBlock;
@property bool useLocationServices;
@property bool usePushNotifications;
@property NSArray<NSString*>* optOutFields;

@end
