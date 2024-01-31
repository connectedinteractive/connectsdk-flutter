//
//  ConnectTrackerEventCallback.h
//  ConnectSDK
//
//  Created by Marcelo on 2020-03-20.
//  Copyright © 2020 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectTrackerEvent.h"
#import "ConnectTrackerFailedEvent.h"
#import "ConnectTrackerAttribution.h"
#import "ConnectTrackerSession.h"
#import "ConnectTrackerSessionFailed.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ConnectTrackerCallback<NSObject>

-(void)onEventTracked:(ConnectTrackerEvent*)connectTrackerEvent;
-(void)onEventTrackFailed:(ConnectTrackerFailedEvent*)connectTrackerFailedEvent;
-(void)onAttributionChanged:(ConnectTrackerAttribution*)connectTrackerAttribution;
-(void)onSessionStartSuccess:(ConnectTrackerSession*)connectTrackerSession;
-(void)onSessionStartFailed:(ConnectTrackerSessionFailed*)connectTrackerSessionFailed;

@end

NS_ASSUME_NONNULL_END
