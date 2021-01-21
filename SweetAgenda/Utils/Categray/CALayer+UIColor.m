//
//  CALayer+UIColor.m
//  DuKeXin
//
//  Created by ZyZl on 2018/7/20.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import "CALayer+UIColor.h"

@implementation CALayer (UIColor)

-(void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

-(void)setShadowColorFromUIColor:(UIColor *)shadowColorFromUIColor
{
    self.shadowColor = shadowColorFromUIColor.CGColor;
}

+(CALayer *)createCustomShadowLayerWithFrame:(CGRect)frame shadowColor:(UIColor *)shadowcolor cornerRadius:(CGFloat)radius offset:(CGSize)offset
{
    CALayer *layer = [CALayer layer];
    [layer setFrame:frame];
    [layer setBackgroundColor:shadowcolor.CGColor];
    [layer setCornerRadius:radius];
    [layer setShadowOpacity:0.5];
    [layer setShadowOffset:offset];
    
    return layer;
}

@end
