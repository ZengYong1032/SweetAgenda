//
//  ZYColorTool.h
//  ZYDriving
//
//  Created by ZyZl on 15/03/2018.
//  Copyright © 2018 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ZYGradientColorDirection) {
    ZYGradientColorDirectionHorizontal = 0,
    ZYGradientColorDirectionVertical
};

@interface ZYColorTool : NSObject

+ (void)gradientChangeColor:(UIColor *)color target:(UIView *)view frame:(CGRect)theFrame mark:(NSInteger) marks;
+ (NSDictionary *)getRGBDictionaryByColor:(UIColor *)originColor;
+ (void)gradientChangeStarColor:(UIColor *)scolor endColor:(UIColor *)ecolor target:(UIView *)view frame:(CGRect)theFrame startPoint:(CGPoint)spoint endPoint:(CGPoint)epoint;
+ (void)gradientChangeDefaultColorWithTarget:(UIView *)view size:(CGSize)theSize direction:(ZYGradientColorDirection)direction;
// 透明度固定为1，以0x开头的十六进制转换成的颜色
+ (UIColor *)colorWithHex:(long)hexColor;
// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)colorWithHexString: (NSString *)color;

@end
