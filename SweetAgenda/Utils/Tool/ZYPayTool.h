//
//  DKXPayTool.h
//  DuKeXin
//
//  Created by ZyZl on 2018/8/28.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *ZYPayResultNotificationIdentifier = @"ZYPayResultNotification";

typedef NS_ENUM(NSInteger,ZYPaymentType) {
    ZYPaymentTypeAli = 0,
    ZYPaymentTypeWeChat,
    ZYPaymentTypeBalance
};

typedef NS_ENUM(NSInteger,ZYGoodsType) {
    ZYGoodsTypeWebGamePay = 0,
    ZYGoodsTypeRPRelease,
    ZYGoodsTypeOtherGamePay,
    ZYGoodsTypeSmallGamePay
};

@interface ZYPayTool : NSObject

+ (void)createIdentAndPayWithTarget:(UIViewController *)target paymentType:(ZYPaymentType)paytype goodsType:(ZYGoodsType)goodstype goodsInfo:(NSDictionary *)infos;

+ (void)verifyIdentPayState;

+ (void)openWechatWithInfos:(NSDictionary *)payinfo;


@end
