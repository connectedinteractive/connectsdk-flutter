//
//  ConnectTrackerSessionFailed.h
//  Adjust
//
//  Created by Marcelo on 2020-09-24.
//

#import <Foundation/Foundation.h>
#import "ConnectTrackerSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConnectTrackerSessionFailed : ConnectTrackerSession

@property bool willRetry;

-(NSMutableDictionary*)toParameterDictionary;

@end

NS_ASSUME_NONNULL_END
