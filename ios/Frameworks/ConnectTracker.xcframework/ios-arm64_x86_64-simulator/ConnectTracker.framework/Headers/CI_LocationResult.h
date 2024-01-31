//
//  CI_LocationResult.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 2019-01-16.
//  Copyright © 2019 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CI_LocationResult <NSObject>

@required
-(void)onLocationResult: (CLLocation*) location;
-(void)onLocationError;

@end

NS_ASSUME_NONNULL_END
