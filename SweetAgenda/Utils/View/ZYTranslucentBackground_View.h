//
//  ZYTranslucentBackground_View.h
//  SaveSuperman
//
//  Created by ZIZy on 2019/6/10.
//  Copyright © 2019 ZIZy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYTranslucentBackground_View : UIView

@property (nonatomic,assign) CGFloat          backgroundAlpha;

-(instancetype)initWithFrame:(CGRect)frame alpha:(CGFloat)alpha white:(CGFloat)white;
-(instancetype)initWithFrame:(CGRect)frame alpha:(CGFloat)alpha white:(CGFloat)white cornerRadius:(float)radius;

@end

NS_ASSUME_NONNULL_END
