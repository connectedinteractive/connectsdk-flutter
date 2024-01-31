//
//  CI_AuthenticationHttpClient.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 21/12/17.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CI_HttpClient.h"
#import "ConnectDeviceInfo.h"

@interface CI_AuthenticationHttpClient : CI_HttpClient

+ (void) httpPost: (NSString*) urlString withAppKey:(NSString*)appKey withDeviceInfo:(ConnectDeviceInfo*)deviceInfo withData: (NSData*) data withHeaders: (NSMutableDictionary*) headers withSuccess: (void (^)(NSData* data))success withError: (void (^)(NSError* error))error;
+ (BOOL) canSendRequest: (ConnectDeviceInfo*) deviceInfo;

@end
