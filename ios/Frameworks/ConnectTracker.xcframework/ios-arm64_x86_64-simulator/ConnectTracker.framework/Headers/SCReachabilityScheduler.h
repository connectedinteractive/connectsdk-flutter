//
//  SCReachabilityScheduler.h
//  SCNetworkReachability
//
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "SCNetworkStatus.h"

@interface SCReachabilityScheduler : NSObject

- (id)initWithReachabilityRef:(SCNetworkReachabilityRef)reachabilityRef;
- (void)observeStatusChanges:(void (^)(SCNetworkStatus status))statusChangesBlock;

@end