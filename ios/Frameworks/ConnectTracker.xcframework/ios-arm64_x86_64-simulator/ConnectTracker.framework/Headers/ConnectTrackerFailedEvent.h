//
//  ConnectTrackerFailedEvent.h
//  Adjust
//
//  Created by Marcelo on 2020-09-24.
//

#import <Foundation/Foundation.h>
#import "ConnectTrackerEvent.h"

NS_ASSUME_NONNULL_BEGIN

#define CONNECTTRACKER_WILL_RETRY @"CI_WILL_RETRY"

@interface ConnectTrackerFailedEvent : ConnectTrackerEvent

@property bool willRetry;

-(NSMutableDictionary*)toParameterDictionary;

@end

NS_ASSUME_NONNULL_END
