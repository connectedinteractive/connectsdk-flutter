//
//  CI_HmacUtils.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 21/12/17.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CI_HmacUtils : NSObject

+ (NSString*)hashHmacText: (NSString*) key withText: (NSString*) text;

@end
