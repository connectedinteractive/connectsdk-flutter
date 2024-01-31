//
//  AttributionData.h
//  Adjust
//
//  Created by Marcelo on 2020-09-24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define CONNECTTRACKER_CAMPAIGN @"CI_CAMPAIGN"
#define CONNECTTRACKER_LINE_ITEM @"CI_LINE_ITEM"
#define CONNECTTRACKER_CREATIVE @"CI_CREATIVE"
#define CONNECTTRACKER_NETWORK @"CI_NETWORK"
#define CONNECTTRACKER_IMPRESSION_ID @"CI_IMPRESSION_ID"

@interface AttributionData : NSObject

@property NSString* campaign;
@property NSString* lineItem;
@property NSString* creative;
@property NSString* network;
@property NSString* impressionId;

-(void)setParameterDictionary:(NSMutableDictionary*) dictionary;

@end

NS_ASSUME_NONNULL_END
