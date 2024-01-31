//
//  ConnectDeviceInfo
//
//

@interface ConnectDeviceInfo : NSObject

@property (nonatomic, copy) NSString *idfa;
@property (nonatomic, copy) NSString *connectTrackerSDKVersion;
@property (nonatomic, copy) NSString *trackingId;
@property (nonatomic, copy) NSString *appKey;
@property (nonatomic, copy) NSString *appVersion;
@property (nonatomic, copy) NSString *osVersion;

- (void)initSystem;
- (BOOL)isInitialized;
- (void)setLastLocationTimestamp: (NSNumber*)locationTimestamp;
- (void)setRegistrationToken: (NSString*)registrationToken;
- (NSNumber*)lastLocationTimestamp;
- (void)setLatitude: (NSNumber*)latitude;
- (void)setLongitude: (NSNumber*)longitude;
- (void)setHorizontalAccuracy: (NSNumber*) horizontalAccuracy;
- (void)setAltitude: (NSNumber*) altitude;
- (void)setFloor: (NSNumber*) floor;
- (void)setCourse: (NSNumber*) course;
- (void)setCourseAccuracy: (NSNumber*) courseAccuracy;
- (void)setSpeed: (NSNumber*) speed;
- (void)setSpeedAccuracy: (NSNumber*) speedAccuracy;
- (void)setLocationTimestamp: (NSDate*) timestamp;
- (void)setVerticalAccuracy: (NSNumber*) verticalAccuracy;
- (void)setLocationId: (NSString*) locationId;
- (NSString*)locationId;

- (void)setHmacKey: (NSString*) hmacKey;
- (NSString*)getHmacKey;
- (void)resetLocation;
- (NSDictionary*)getLocationDictionary;
- (NSString*)registrationToken;
- (bool)isFirstInstall;
- (void)setFirstOpenAdjust;
- (bool)isFirstOpenAdjust;

@end
