//
//  SCNetworkReachability.h
//  SCNetworkReachability
//

#import <Foundation/Foundation.h>
#import "SCNetworkStatus.h"

@interface SCNetworkReachability : NSObject

@property (nonatomic, readonly) NSString *host;

- (id)initWithHost:(NSString *)host;
- (void)observeReachability:(void (^)(SCNetworkStatus status))block;
- (void)reachabilityStatus:(void (^)(SCNetworkStatus status))block;
+ (void)host:(NSString *)host reachabilityStatus:(void (^)(SCNetworkStatus status))block;

@end
