//
//  ZYTranslucentBackground_View.m
//  SaveSuperman
//
//  Created by ZIZy on 2019/6/10.
//  Copyright © 2019 ZIZy. All rights reserved.
//

#import "ZYTranslucentBackground_View.h"

@implementation ZYTranslucentBackground_View

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:kClearColor];
        UIView *tanslucentView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        [tanslucentView setBackgroundColor:kCustomGrayColor(0.4, 0.5)];
        [tanslucentView setTag:20070600];
        [self addSubview:tanslucentView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame alpha:(CGFloat)alpha white:(CGFloat)white
{
    if (self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:kClearColor];
        UIView *tanslucentView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        [tanslucentView setBackgroundColor:kCustomGrayColor(white, alpha)];
        [tanslucentView setTag:20070600];
        [self addSubview:tanslucentView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame alpha:(CGFloat)alpha white:(CGFloat)white cornerRadius:(float)radius
{
    if (self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:kClearColor];
        self.layer.cornerRadius = radius;
        UIView *translucentView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        translucentView.layer.cornerRadius = radius;
        [translucentView setTag:20070600];
        [translucentView setBackgroundColor:kCustomGrayColor(white, alpha)];
        [self addSubview:translucentView];
    }
    return self;
}


- (void)setBackgroundAlpha:(CGFloat)backgroundAlpha {
    _backgroundAlpha = backgroundAlpha;
    UIView *bgview = [self viewWithTag:20070600];
    if (bgview) {
        [bgview setBackgroundColor:kCustomGrayColor(0, backgroundAlpha)];
    }
}

@end
