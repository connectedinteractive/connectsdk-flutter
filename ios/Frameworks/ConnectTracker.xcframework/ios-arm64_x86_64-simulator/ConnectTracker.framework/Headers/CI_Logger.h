//
//  CI_Logger.h
//  ConnectSDK
//
//  Created by Tom Clark on 2017-02-27.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface CI_Logger : NSObject
+(void)CILog:(NSString *)msg forceLog:(BOOL) forceLog;
+ (void)CILog:(NSString *)msg;
+(void)CILog:(NSString *)msg withFormat:(NSString *) formatString;
+ (void)CILogDictionary:(NSDictionary *)dictionary;
+(bool)shouldLog;
@end
