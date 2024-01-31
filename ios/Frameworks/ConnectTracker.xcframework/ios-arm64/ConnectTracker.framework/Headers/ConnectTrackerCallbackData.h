//
//  ConnectTrackerCallbackData.h
//  Adjust
//
//  Created by Marcelo on 2020-09-24.
//

#import <Foundation/Foundation.h>
#import "AttributionData.h"

NS_ASSUME_NONNULL_BEGIN

#define CONNECTTRACKER_TRACKING_ID @"CI_TRACKING_ID"
#define CONNECTTRACKER_CONNECTSDK_VERSION @"CI_CONNECTSDK_VERSION"
#define CONNECTTRACKER_IDFA @"CI_IDFA"

@interface ConnectTrackerCallbackData : NSObject

@property NSString* trackingId;
@property NSString* sdkVersion;
@property NSString* idfa;

@property AttributionData* attribution;

-(NSMutableDictionary*)toParameterDictionary;

@end

NS_ASSUME_NONNULL_END
