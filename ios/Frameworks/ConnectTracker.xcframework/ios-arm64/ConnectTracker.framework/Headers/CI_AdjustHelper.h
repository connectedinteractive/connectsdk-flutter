//
//  CI_AdjustHelper.h
//  ConnectSDK
//
//  Created by Marcelo on 2020-09-02.
//  Copyright © 2020 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectDeviceInfo.h"
#import "ConnectTrackerCallback.h"
#import <AdjustSdk/Adjust.h>

NS_ASSUME_NONNULL_BEGIN

@interface CI_AdjustHelper : NSObject<AdjustDelegate>

@property ConnectDeviceInfo* deviceInfo;
@property (nonatomic, weak) id<ConnectTrackerCallback> connectTrackerCallback;
@property NSString* adjustToken;

-(void)createAdjustMapping:(NSDictionary*)response;
-(void)trackEventsAdjust:(NSArray*)events;
-(void)setPushToken:(NSData*)pushToken;
-(void)setSessionLocationId:(nullable NSString*)locationId;
-(void)initAdjust;
-(void)appWillOpenUrl:(NSURL*) url;
-(void)linkResolution:(NSURL*) url urlSuffixArray:(NSArray*) urlSuffixArray callback:(void (^_Nullable)(NSURL* resolvedUrl)) callback;
-(void)setEnable:(BOOL) enable;
-(BOOL)isAdjustEnabled;
-(BOOL)isAdjustInitialized;
-(void)gdprForgetMe;
-(NSString *)getIdfa;

@end

NS_ASSUME_NONNULL_END
