//
//  CI_EventCallbackUtils.h
//  ConnectSDK
//
//  Created by Marcelo on 2020-03-20.
//  Copyright © 2020 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectDeviceInfo.h"
#import "CI_ImpressionID.h"
#import "ConnectTrackerEvent.h"
#import "ConnectTrackerSessionEventData.h"
#import "ConnectTrackerAttribution.h"
#import "ConnectTrackerFailedEvent.h"
#import "ConnectTrackerSession.h"
#import "ConnectTrackerSessionFailed.h"

NS_ASSUME_NONNULL_BEGIN

@interface CI_EventCallbackUtils : NSObject

@property ConnectDeviceInfo* deviceInfo;

-(ConnectTrackerEvent*)getConnectTrackerEvent:(NSString*) name withTimestamp:(NSString*) timestamp transformName:(bool) transformName;
-(ConnectTrackerFailedEvent*)getConnectTrackerFailedEvent:(NSString*) name withTimestamp:(NSString*)timestamp willRetry:(bool)willRetry transformName:(bool) transformName;
-(ConnectTrackerAttribution*)getConnectTrackerAttribution;
-(ConnectTrackerSession*)getConnectTrackerSession:(NSString*) timestamp;
-(ConnectTrackerSessionFailed*)getConnectTrackerSessionFailed:(bool)willRetry withTimestamp:(NSString*) timestamp;

@end

NS_ASSUME_NONNULL_END
