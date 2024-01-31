//
//  CI_Notification.h
//  ConnectSDK
//
//  Created by Tom Clark on 2017-02-27.
//  Copyright © 2017 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CI_Notification : NSObject

typedef void (^NotifcationBlock) (CI_Notification*_Nonnull);
typedef void (^NotifcationBlock) (CI_Notification*_Nonnull);

// Parsed Properties
@property (nonatomic, strong) NSString * _Nullable deepLink;
@property (nonatomic, strong) NSString * _Nullable alert;
@property (nonatomic, strong) NSString * _Nullable clientID;
@property (nonatomic, strong) NSString * _Nullable sound;
@property (nonatomic, strong) NSString * _Nonnull messageID;

//Raw Data
@property (nonatomic, strong) NSDictionary * _Nonnull rawDictionary;

- (id _Nonnull)init:(NSDictionary *_Nonnull)pushDictionary;
- (id _Nullable)initWithCoder:(NSCoder *_Nonnull)decoder;
- (void)encodeWithCoder:(NSCoder *_Nonnull)encoder;

@end
