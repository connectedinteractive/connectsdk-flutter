//
//  CI_AuthenticationQueue.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 21/12/17.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CI_AuthenticationPostMessage.h"

@interface CI_AuthenticationQueue : NSObject

-(void)addToQueue: (CI_AuthenticationPostMessage*) authenticationPostMessage;

@end
