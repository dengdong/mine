#import <Foundation/Foundation.h>

@interface BNRLogger:NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
	NSMutableData *_incomingData;
}
@property (nonatomic) NSDate *lastTime;

-(NSString *)lastTimeString;
-(void)updateLastTime:(NSTimer *)t;

@end