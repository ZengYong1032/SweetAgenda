//
//  DKXPayTool.m
//  DuKeXin
//
//  Created by ZyZl on 2018/8/28.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import "ZYPayTool.h"

@implementation ZYPayTool

+(void)createIdentAndPayWithTarget:(UIViewController *)target paymentType:(ZYPaymentType)paytype goodsType:(ZYGoodsType)goodstype goodsInfo:(NSDictionary *)infos {
    NSMutableDictionary *parametersDict = [NSMutableDictionary dictionary];
    NSString *paytypestr;
//    kAppDelegate.isWeb = NO;
    if (goodstype == ZYGoodsTypeWebGamePay) {
//        kAppDelegate.isWeb = YES;
        parametersDict = [NSMutableDictionary dictionaryWithDictionary:infos];
    }
    else if (goodstype == ZYGoodsTypeOtherGamePay) {
//        kAppDelegate.isSmall = YES;
        parametersDict = [NSMutableDictionary dictionaryWithDictionary:infos];
    }
    
    if (paytype == ZYPaymentTypeWeChat)
    {
        paytypestr = @"2";
    }
    else if (paytype == ZYPaymentTypeBalance) {
        paytypestr = @"3";
    }
    
    if (goodstype == ZYGoodsTypeWebGamePay || goodstype == ZYGoodsTypeOtherGamePay) {
        parametersDict[@"payType"] = paytypestr;
    }
    else {
        parametersDict[@"type"] = paytypestr;
    }
    
    ZYLog(@"parametersDict = %@",parametersDict);
    if (goodstype == ZYGoodsTypeWebGamePay) {
        /*
        [HttpTool fetchChargeOrderWithParameters:parametersDict success:^(id response) {
            if ([response[@"code"] integerValue] == 1) {
                kAppDelegate.currentIdentNumber = kConvertIntValueToString(response[@"data"][@"order_id"]);
                
                if (paytype == ZYPaymentTypeWeChat) {
                    NSDictionary *dd = response[@"data"];
                    [target removeNormalIndicator];
                    [DKXPayTool openWechatWithInfos:dd];
                }
            }
            else {
                [kNotificationCenter postNotificationName:ZYPayResultNotificationIdentifier object:nil userInfo:@{@"Result":@"0",@"Error":kStringConvert(response[@"message"])}];
            }
        } failure:^(NSError *error) {
            [kNotificationCenter postNotificationName:ZYPayResultNotificationIdentifier object:nil userInfo:@{@"Result":@"0"}];
        }];
         */
    }
    else if (goodstype == ZYGoodsTypeOtherGamePay) {
        /*
        [HttpTool fetchSmallChargeOrderWithParameters:parametersDict success:^(id response) {
            if ([response[@"code"] integerValue] == 1) {
                kAppDelegate.currentIdentNumber = kConvertIntValueToString(response[@"data"][@"pay_data"][@"order_id"]);
                if (paytype == ZYPaymentTypeWeChat) {
                    NSDictionary *dd = response[@"data"][@"pay_data"][@"prepay_id"];
                    [target removeNormalIndicator];
                    [DKXPayTool openWechatWithInfos:dd];
                }
            }
            else {
                [kNotificationCenter postNotificationName:ZYPayResultNotificationIdentifier object:nil userInfo:@{@"Result":@"0",@"Error":kStringConvert(response[@"message"])}];
            }
        } failure:^(NSError *error) {
            [kNotificationCenter postNotificationName:ZYPayResultNotificationIdentifier object:nil userInfo:@{@"Result":@"0"}];
        }];
         */
    }
}

+ (void)openWechatWithInfos:(NSDictionary *)payinfo {
    //生成URLscheme
    NSString *str = [NSString stringWithFormat:@"weixin://app/%@/pay/?nonceStr=%@&package=%@&partnerId=%@&prepayId=%@&timeStamp=%@&sign=%@&signType=SHA1",payinfo[@"appid"],payinfo[@"noncestr"],[ZYStringTool URLEncodedString:payinfo[@"package"]],payinfo[@"partnerid"],payinfo[@"prepayid"],payinfo[@"timestamp"],payinfo[@"sign"]];
    ZYLog(@"\nstr = %@\n",str);
    //通过openURL的方法唤起支付界面
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:^(BOOL success) {
        if (!success) {
//            kAppDelegate.isSmall = NO;
            [kNotificationCenter postNotificationName:ZYPayResultNotificationIdentifier object:nil userInfo:@{@"Result":@"0"}];
        }
    }];
}

+ (void)verifyIdentPayState {
    
}
@end
