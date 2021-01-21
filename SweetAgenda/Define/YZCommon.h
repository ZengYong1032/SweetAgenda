//
//  YZCommon.h
//  SweetAgenda
//
//  Created by ZiZY-iMac on 2021/1/21.
//  Copyright © 2021 GreekMythology. All rights reserved.
//

#ifndef YZCommon_h
#define YZCommon_h

//获取系统对象
#define kApplication                                            [UIApplication sharedApplication]
#define kAppDelegate                                            ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kAppWindow                                              [ZYCustomControls fetchAppWindow]
#define kRootViewController                                     kAppWindow.rootViewController
#define kUserDefaults                                           [NSUserDefaults standardUserDefaults]
#define kNotificationCenter                                     [NSNotificationCenter defaultCenter]
#define kFileManager                                            [NSFileManager defaultManager]
#define kCurrentDevice                                          [UIDevice currentDevice]
#define kBundle                                                 [NSBundle mainBundle]
#define kUserNotificationCenter                                 [UNUserNotificationCenter currentNotificationCenter]
///剪切板
#define kPasteboard                                             [UIPasteboard generalPasteboard]
/// 系统版本
#define CurrentSystemVersion                                    [[UIDevice currentDevice].systemVersion doubleValue]
/// UUID
#define kCurrentDeviceUUID                                      [[kCurrentDevice identifierForVendor] UUIDString]
/// uniqueIdentifier
#define kUNIQUEID                                               [kCurrentDevice uniqueIdentifier]
/// Device name (user custom)
#define kCurrentDeviceName                                      [kCurrentDevice name]
/// Device system name
#define kCurrentDeviceSystemName                                [kCurrentDevice systemName]
/// Device system version
#define kCurrentDeviceSystemVersion                             [kCurrentDevice systemVersion]
/// Device model / localizedmodel
#define kCurrentDeviceModel                                     [kCurrentDevice model]
#define kCurrentDeviceLocalizedModel                            [kCurrentDevice localizedModel]
/// APPInformations
#define kAPPInfoDictionary                                      [[NSBundle mainBundle] infoDictionary]
/// APP Name
#define kAPPName                                                [kAPPInfoDictionary objectForKey:@"CFBundleDisplayName"]
/// APP Version
#define kAPPVersion                                             [kAPPInfoDictionary objectForKey:@"CFBundleShortVersionString"]
/// APP Build Version
#define kAPPBuildVersion                                        [kAPPInfoDictionary objectForKey:@"CFBundleVersion"]
/// 当前语言
#define CurrentLanguage                                         ([[NSLocale preferredLanguages] objectAtIndex:0])


/// 沙盒目录
//系统文件目录（不可随意存放，会被拷贝到iCloud）
#define kDocumentPath                                           [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject]
//不可随意存放，影响上架
#define kLibraryPath                                            [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) lastObject]
//缓存目录,不会被系统自动清除
#define kCachePath                                              [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject]
//系统临时缓存目录、内存紧张时会被系统自动清除
#define kTmpPath                                                NSTemporaryDirectory()

/// 文件操作相关
#define kFileManager                                            [NSFileManager defaultManager]


// 设备相关
#define kScreenAppFrame                                         [[UIScreen mainScreen] applicationFrame]
/// 窗口位置尺寸信息
#define kScreen_Bounds                                          [UIScreen mainScreen].bounds
/// 窗口宽
#define kScreenWidth                                            [UIScreen mainScreen].bounds.size.width
/// 窗口高
#define kScreenHeight                                           [UIScreen mainScreen].bounds.size.height
/// 相较于Iphone6s宽的比值
#define Iphone6ScaleWidth                                       kScreenWidth / 375.0
/// 相较于Iphone6s高的比值
#define Iphone6ScaleHeight                                      kScreenHeight / 667.0
/// 基于Iphone6s宽的长度
#define IP6SW(number)                                           (kScreenWidth * number) / 375.0
/// 基于Iphone6s高的长度
#define IP6SH(number)                                           (kScreenHeight * number) / 667.0
/// 导航栏加状态栏高度
#define kNavigationBarHeight                                    ([UINavigationController new].navigationBar.frame.size.height + kStatusBarHeight)
/// 导航栏高度
#define kLNavigationBarHeight                                   (kNavigationBarHeight - Height_StatusBar)
/// Tab栏高度
#define kTabBarHeight                                           ([UITabBarController new].tabBar.size.height)
/// 状态栏高度
#define kStatusBarHeight                                        [ZYConvertTool fetchDeviceStatusBarHeight]


// 常规颜色
#define kClearColor                                             [UIColor clearColor] //clear
#define kWhiteColor                                             [UIColor whiteColor] //white
#define kBlackColor                                             [UIColor blackColor] //black
#define kGrayColor                                              [UIColor grayColor]   //gray
#define KDarkGrayColor                                          [UIColor darkGrayColor]
#define kCyanColor                                              [UIColor cyanColor]   //cyan
#define kOrangeColor                                            [UIColor orangeColor]    //orange
#define kGray2Color                                             [UIColor lightGrayColor]  //lightGray
#define kGreenColor                                             [UIColor greenColor]      //green
#define kBlueColor                                              [UIColor blueColor]        //blue
#define kRedColor                                               [UIColor redColor]          //red
#define kYellowColor                                            [UIColor yellowColor]    //yellow
#define kMagentaColor                                           [UIColor magentaColor]  //magenta
#define kPurpleColor                                            [UIColor purpleColor]    //purple
#define kBrownColor                                             [UIColor brownColor]      //brown
#define kCustomGrayColor(WHITE,ALPHA)                           [[UIColor alloc] initWithWhite:WHITE alpha:ALPHA]
#define ZYCustomGrayColor(WHITE)                                [[UIColor alloc] initWithWhite:(WHITE/255.f) alpha:1]

#define kConvertColorFromHexString(hexstring)                   [ZYColorTool colorWithHexString:hexstring]
#define kCustomColor(RED,GREEN,BLUE,ALPHA)                      [UIColor colorWithRed:(RED/255.f) green:(GREEN/255.f) blue:(BLUE/255.f) alpha:(ALPHA)]
#define kRandomColor                                            [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256.0)/255.0 blue:arc4random_uniform(256.0)/255.0 alpha:arc4random_uniform(256.0)/255.0]//随机色

//字符串相关
/// 拼接字符串
#define NSStringFormat(format,...)                              [NSString stringWithFormat:format,##__VA_ARGS__]
/// 比较俩字符串
#define ZYCompareTwoString(A,B)                                 [A isEqualToString:B]
#define kConvertStringWithInteger(ainteger)                     NSStringFormat(@"%ld",ainteger)
#define kConvertStringWithInt(aint)                             NSStringFormat(@"%d",aint)
#define kConvertValueToString(value)                            NSStringFormat(@"%@",value)


// 图片
/// 通过名称获取图片
#define IMGBYNAME(imgName)                                      [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
/// 通过本地路径获取图片
#define IMGBYPath(imgpath)                                      [[UIImage imageWithContentsOfFile:imgpath] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
/// 配置图片RenderingMode
#define ConfigurationRenderingModeIMG(img)                      [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

//字体
#define BOLDSYSTEMFONt(FONTSIZE)                                [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)                                    [UIFont systemFontOfSize:FONTSIZE]
#define CourierFont(FONTSIZE)                                   [UIFont fontWithName:@"Courier" size:(FONTSIZE)]
#define CourierObliqueFont(FONTSIZE)                            [UIFont fontWithName:@"Courier-Oblique" size:(FONTSIZE)]
#define FONT(NAME,FONTSIZE)                                     [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define BoldFONT(FONTSIZE)                                      [UIFont fontWithName:@"Georgia-Bold" size:(FONTSIZE)]


//String Or SEL转换快捷方式
#define kConvertStringWithSel(sel)                              NSStringFromSelector(sel)
#define kConvertSelWithString(name)                             NSSelectorFromString(name)

//随机数
/// 随机整数数字形式
#define kObtainRandomInt(starts,ends)                           ((int)(starts + (arc4random()%(ends - starts + 1))))
/// 随机整数字符串形式
#define kObtainRandomIntString(starts,ends)                     [NSString stringWithFormat:@"%d",kObtainRandomInt(starts,ends)]

//弱引用/强引用
#define kWeakSelf(type)                                         __weak typeof(type) weak##type = type;
#define kStrongSelf(type)                                       __strong typeof(type) strong##type = type;

// 度数与角度的转化
/// 角度转化为度
#define kDegreesToRadian(x)                                     (M_PI * (x) / 180.0)
/// 度转化为角度
#define kRadianToDegrees(radian)                                (radian*180.0)/(M_PI)

//其他快捷操作
#define kVerifyObjectWithClassName(object,classname)            [object isKindOfClass:[classname class]]
#define UIRectCornerTop                                         (UIRectCornerTopLeft|UIRectCornerTopRight)
#define UIRectCornerBottom                                      (UIRectCornerBottomLeft|UIRectCornerBottomRight)
#define UIRectCornerLeft                                        (UIRectCornerTopLeft|UIRectCornerBottomLeft)
#define UIRectCornerRight                                       (UIRectCornerTopRight|UIRectCornerBottomRight)

//自定义打印
#ifdef DEBUG
#define ZYLog(...) NSLog(@" %s 第%d行 \n \n **** %@ ****\n\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZYLog(...)
#endif

#endif /* YZCommon_h */
