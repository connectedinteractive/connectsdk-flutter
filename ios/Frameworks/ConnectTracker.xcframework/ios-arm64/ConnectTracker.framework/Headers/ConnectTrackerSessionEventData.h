//
//  ConnectTrackerSessionEventData.h
//  Adjust
//
//  Created by Marcelo on 2020-09-24.
//

#import <Foundation/Foundation.h>
#import "ConnectTrackerCallbackData.h"

NS_ASSUME_NONNULL_BEGIN

#define CONNECTTRACKER_TIMESTAMP @"CI_TIMESTAMP"

@interface ConnectTrackerSessionEventData : ConnectTrackerCallbackData

@property NSString* timestamp;

-(NSMutableDictionary*)toParameterDictionary;

@end

NS_ASSUME_NONNULL_END
