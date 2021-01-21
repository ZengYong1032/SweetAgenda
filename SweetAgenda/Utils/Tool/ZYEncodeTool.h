//
//  ZYEncodeTool.h
//  ScanCat
//
//  Created by ZyZl on 2018/7/1.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYEncodeTool : NSObject

+ (NSString *)getmd5WithString:(NSString*)string;
+ (NSString *)getmd5WithData:(NSData*)data;

+ (NSString *)jsonObjectConvertToJsonString:(id)object;
+ (NSString *)jsonObjectConvertToJSJsonString:(id)object;
+ (id)jsonDataConvertToDictionaryOrArray:(NSData *)jsonData;

@end
