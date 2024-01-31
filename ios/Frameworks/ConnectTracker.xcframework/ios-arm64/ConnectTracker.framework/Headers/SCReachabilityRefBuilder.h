//
//  SCReachabilityRefBuilder.h
//  SCNetworkReachability
//
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface SCReachabilityRefBuilder : NSObject

+ (SCNetworkReachabilityRef)reachabilityRefWithHostName:(NSString *)hostName;

@end