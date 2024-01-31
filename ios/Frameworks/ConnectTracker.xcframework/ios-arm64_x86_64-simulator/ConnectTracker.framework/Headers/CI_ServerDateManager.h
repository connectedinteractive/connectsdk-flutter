//
//  CI_ServerDateManager.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 27/12/17.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CI_ServerDateManager : NSObject

- (BOOL) isServerDateAvailable;
- (NSDate*) currentTime;
- (void) setServerTime: (long) serverTime;
+ (CI_ServerDateManager *)sharedInstance;

@end
