//
//  CALayer+UIColor.h
//  DuKeXin
//
//  Created by ZyZl on 2018/7/20.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (UIColor)

+(CALayer *)createCustomShadowLayerWithFrame:(CGRect)frame shadowColor:(UIColor *)shadowcolor cornerRadius:(CGFloat)radius offset:(CGSize)offset;

@end
