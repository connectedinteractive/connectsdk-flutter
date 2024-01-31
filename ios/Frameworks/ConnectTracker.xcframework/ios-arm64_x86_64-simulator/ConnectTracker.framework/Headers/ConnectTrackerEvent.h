//
//  ConnectTrackerEvent.h
//  Adjust
//
//  Created by Marcelo on 2020-09-24.
//

#import <Foundation/Foundation.h>
#import "ConnectTrackerSessionEventData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConnectTrackerEvent : ConnectTrackerSessionEventData

@property NSString* name;

@end

NS_ASSUME_NONNULL_END
