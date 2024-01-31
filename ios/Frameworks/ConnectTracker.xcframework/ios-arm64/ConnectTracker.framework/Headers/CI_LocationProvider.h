//
//  CI_LocationProvider.h
//  ConnectSDK
//
//  Created by Marcelo Santos on 2019-01-15.
//  Copyright © 2019 Connected Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "CI_LocationResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface CI_LocationProvider : NSObject<CLLocationManagerDelegate>

@property (nonatomic, weak) id<CI_LocationResult> delegate;

-(id)init;
-(void)getLocation;
+(bool)hasLocationPermission;

@end

NS_ASSUME_NONNULL_END
