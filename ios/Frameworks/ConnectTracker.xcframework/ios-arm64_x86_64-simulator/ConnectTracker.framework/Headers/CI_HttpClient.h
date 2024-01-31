//
//  CI_HttpClient.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 21/12/17.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CI_HttpClient : NSObject

+ (void) httpPost: (NSString*) urlString withData: (NSData*) data withHeaders: (NSMutableDictionary*) headers withSuccess: (void (^)(NSData* data))success withError: (void (^)(NSError* error))error;

@end
