//
//  NSTimer+YZSafeTimer.m
//  miliao
//
//  Created by ZiZY-iMac on 2020/8/4.
//  Copyright © 2020 ZIZY. All rights reserved.
//

#import "NSTimer+YZSafeTimer.h"

@implementation NSTimer (YZSafeTimer)

+ (NSTimer *)YZScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void (^)(void))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(handle:) userInfo:[block copy] repeats:repeats];
}

+ (void)handle:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
