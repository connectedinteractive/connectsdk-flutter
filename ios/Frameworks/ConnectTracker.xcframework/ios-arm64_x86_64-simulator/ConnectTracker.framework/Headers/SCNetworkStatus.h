//
//  SCNetworkStatus.h
//  SCNetworkReachability
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SCNetworkStatus)
{
    SCNetworkStatusNotReachable = 0,
#if TARGET_OS_IPHONE
    SCNetworkStatusReachableViaWiFi = 1,
    SCNetworkStatusReachableViaCellular = 2
#else
    SCNetworkStatusReachable = 3
#endif
};