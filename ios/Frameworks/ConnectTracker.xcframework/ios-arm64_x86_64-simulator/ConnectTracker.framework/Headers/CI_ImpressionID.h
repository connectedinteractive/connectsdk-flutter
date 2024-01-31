//
//  CI_ImpressionID.h
//  ConnectSDK
//
//  Created by Tom Clark on 2017-02-27.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CI_ImpressionID : NSObject
+ (NSString *) getImpressionID;

@property (class, nonatomic, assign) NSUserDefaults *userDefault;
@end
