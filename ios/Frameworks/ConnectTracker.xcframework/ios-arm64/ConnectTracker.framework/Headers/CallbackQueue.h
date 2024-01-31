#import "ConnectTrackerEvent.h"
#import "ConnectTrackerFailedEvent.h"
#import "ConnectTrackerSession.h"
#import "ConnectTrackerCallback.h"
#import "CI_EventCallbackUtils.h"

@protocol CallbackQueue<NSObject>

-(void)init:(id<ConnectTrackerCallback>)ConnectTrackerCallback withCallbackUtils:(CI_EventCallbackUtils*)eventCallbackUtils;
-(void)addSuccessEvent:(ConnectTrackerEvent*)connectTrackerEvent;
-(void)addErrorEvent:(ConnectTrackerFailedEvent*)connectTrackerFailedEvent;
-(void)addSessionStartSuccess:(ConnectTrackerSession*)connectTrackerSession;
-(void)addSessionStartError:(ConnectTrackerSessionFailed*)connectTrackerSessionFailed;
-(void)sendCallbacks;

@end
