//
//  ZYMethodTool.m
//  DuKeXin
//
//  Created by ZyZl on 2018/8/31.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import "ZYMethodTool.h"

@implementation ZYMethodTool

+ (void)mainHandleBlock:(ZYMainHandleBlock)block {
    if ([NSThread isMainThread]) {
        block();
    }
    else {
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    }
}

+ (void)mainThreadHandleBlock:(ZYMainHandleBlock)block {
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}


+ (void)openApplicationURL:(id)urlstr {
    NSURL *url;
    
    if ([urlstr isKindOfClass:[NSURL class]]) {
        url = urlstr;
    }
    else if ([urlstr containsString:@"http://"] || [urlstr containsString:@"https://"]) {
        url = [NSURL URLWithString:urlstr];
    }
    else if([kApplication canOpenURL:[NSURL URLWithString:NSStringFormat(@"http://%@",urlstr)]]) {
        url = [NSURL URLWithString:NSStringFormat(@"http://%@",urlstr)];
    }
    else if ([kApplication canOpenURL:[NSURL URLWithString:NSStringFormat(@"https://%@",urlstr)]]) {
        url = [NSURL URLWithString:NSStringFormat(@"https://%@",urlstr)];
    }
    else {
        return;
    }
    [kApplication openURL:url options:@{} completionHandler:nil];
}

+ (UIViewController *)fetchCurrentTopVC {
    UIViewController *topViewController = [[self fetchAppWindow] rootViewController];
    while (true) {
        if (topViewController.presentedViewController) {
            topViewController = topViewController.presentedViewController;
        }
        else if([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topViewController topViewController]) {
            topViewController = [(UINavigationController *)topViewController topViewController];
        }
        else if([topViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)topViewController;
            topViewController = tab.selectedViewController;
        }
        else {
            break;
        }
    }
    return topViewController;
}

+ (UIWindow *)fetchAppWindow {
    UIWindow *window = nil;
    if (@available(iOS 13.0, *)) {
        window = kApplication.windows.firstObject;
    }
    else {
        window = kApplication.keyWindow;
    }
    return window;
}

#pragma mark ----------------------------------------------------- QR Create Method -----------------------------------------------------
//生成二维码
+ (UIImage *)generateQRCodeWithString:(NSString *)string Size:(CGFloat)size {
    if (string && string.length > 0) {
        //创建过滤器
        CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        //过滤器恢复默认
        [filter setDefaults];
        //给过滤器添加数据<字符串长度893>
        NSString *shareurl = string;
        NSData *data = [shareurl dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        [filter setValue:data forKey:@"inputMessage"];
        //获取二维码过滤器生成二维码
        CIImage *image = [filter outputImage];
        UIImage *img = [self createNonInterpolatedUIImageFromCIImage:image WithSize:size];
        return img;
    }
    else {
        return nil;
    }
}

//二维码清晰
+ (UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image WithSize:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    //创建bitmap
    size_t width = CGRectGetWidth(extent)*scale;
    size_t height = CGRectGetHeight(extent)*scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    //保存图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 smallImageOrigin:(CGPoint)origin {
    UIGraphicsBeginImageContext(image1.size);
    
    // Draw image1
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    
    // Draw image2
    [image2 drawInRect:CGRectMake(origin.x, origin.y, image2.size.width, image2.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

+ (void)openQQTeamWithIosKey:(NSString *)keystring teamNumber:(NSString *)number {
    NSString *urlStr = [NSString stringWithFormat:@"mqqapi://card/show_pslcard?src_type=internal&version=1&uin=%@&key=%@&card_type=group&source=external&jump_from=webapi",number, keystring];
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
}

@end
