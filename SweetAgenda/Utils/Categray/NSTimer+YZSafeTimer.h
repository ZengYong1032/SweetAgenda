//
//  NSTimer+YZSafeTimer.h
//  miliao
//
//  Created by ZiZY-iMac on 2020/8/4.
//  Copyright © 2020 ZIZY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (YZSafeTimer)

+ (NSTimer *)YZScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(void))block repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
