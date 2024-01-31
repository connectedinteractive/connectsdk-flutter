//
//  CI_Poster.h
//  ConnectSDK
//
//  Created by Tom Clark on 2017-06-29.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectTrackerCallback.h"

@class ConnectDeviceInfo, CI_Event;

@interface CI_Poster : NSObject
+(NSData *)buildPostBody:(NSDictionary *)info;
+ (void)postLocation:(NSString *)appKey andLocation:(NSDictionary *)location andDeviceInfo:(ConnectDeviceInfo *)info withSuccess: (void (^)(NSData* data))success withError: (void (^)(NSError* error))error;
@end
