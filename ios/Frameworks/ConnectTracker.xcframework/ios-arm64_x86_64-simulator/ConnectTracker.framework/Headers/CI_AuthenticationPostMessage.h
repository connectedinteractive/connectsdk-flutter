//
//  CI_AuthenticationPostMessage.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 21/12/17.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectDeviceInfo.h"

@interface CI_AuthenticationPostMessage : NSObject

@property NSString* url;
@property NSData* data;
@property NSMutableDictionary* headers;
@property NSString* appKey;
@property ConnectDeviceInfo* deviceInfo;

@property void(^success)(NSData*);
@property void(^error)(NSError*);

@end
