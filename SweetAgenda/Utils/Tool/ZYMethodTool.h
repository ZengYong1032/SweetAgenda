//
//  ZYMethodTool.h
//  DuKeXin
//
//  Created by ZyZl on 2018/8/31.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZYMainHandleBlock)(void);

@interface ZYMethodTool : NSObject

+ (void)mainHandleBlock:(ZYMainHandleBlock)block;
+ (void)mainThreadHandleBlock:(ZYMainHandleBlock)block;
+ (void)openApplicationURL:(id)urlstr;
+ (UIViewController *)fetchCurrentTopVC;
+ (UIWindow *)fetchAppWindow;

/// 生成二维码
+ (UIImage *)generateQRCodeWithString:(NSString *)string Size:(CGFloat)size;
/// 二维码清晰
+ (UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image WithSize:(CGFloat)size;
/// 合成图片
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 smallImageOrigin:(CGPoint)origin;
/// 直接打开qq群
+ (void)openQQTeamWithIosKey:(NSString *)keystring teamNumber:(NSString *)number;

@end
