//
//  ZYColorTool.m
//  ZYDriving
//
//  Created by ZyZl on 15/03/2018.
//  Copyright © 2018 ZyZl. All rights reserved.
//

#import "ZYColorTool.h"

@implementation ZYColorTool

#pragma mark ---- Gradient Layer Color Method ----
+ (void)gradientChangeColor:(UIColor *)color target:(UIView *)view frame:(CGRect)theFrame mark:(NSInteger) marks {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = marks == 1 ? @[(__bridge id)(color.CGColor),(__bridge id)(kWhiteColor.CGColor)] : @[(__bridge id)(kWhiteColor.CGColor),(__bridge id)(color.CGColor)];
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    gradientLayer.frame= CGRectMake(0, 0, theFrame.size.width, theFrame.size.height);
    [view.layer addSublayer:gradientLayer];
}

+ (void)gradientChangeStarColor:(UIColor *)scolor endColor:(UIColor *)ecolor target:(UIView *)view frame:(CGRect)theFrame startPoint:(CGPoint)spoint endPoint:(CGPoint)epoint {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)(scolor.CGColor),(__bridge id)(ecolor.CGColor)];
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = spoint;
    gradientLayer.endPoint = epoint;
    gradientLayer.frame= CGRectMake(0, 0, theFrame.size.width, theFrame.size.height);
    [view.layer addSublayer:gradientLayer];
    
    if ([view isKindOfClass:[UIButton class]]) {
        [view bringSubviewToFront:((UIButton *)view).titleLabel];
    }
}

+ (void)gradientChangeDefaultColorWithTarget:(UIView *)view size:(CGSize)theSize direction:(ZYGradientColorDirection)direction {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)(kRandomColor.CGColor),(__bridge id)(kRandomColor.CGColor)];
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = CGPointZero;
    gradientLayer.endPoint = (direction == ZYGradientColorDirectionHorizontal ? CGPointMake(1.0, 0):CGPointMake(0.0, 1.0));
    gradientLayer.frame= CGRectMake(0, 0, theSize.width, theSize.height);
    [view.layer addSublayer:gradientLayer];
    
    if ([view isKindOfClass:[UIButton class]]) {
        [view bringSubviewToFront:((UIButton *)view).titleLabel];
    }
}

+ (NSDictionary *)getRGBDictionaryByColor:(UIColor *)originColor {
    CGFloat r=0,g=0,b=0,a=0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [originColor getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(originColor.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return @{@"R":@(r),
             @"G":@(g),
             @"B":@(b),
             @"A":@(a)};
}

+ (UIColor*) colorWithHex:(long)hexColor; {
    return [self colorWithHex:hexColor alpha:1.];
}
// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity {
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}
// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)colorWithHexString: (NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }

    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];

    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;

    //R、G、B
    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
