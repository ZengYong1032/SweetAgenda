//
//  ZYEncodeTool.m
//  ScanCat
//
//  Created by ZyZl on 2018/7/1.
//  Copyright © 2018年 YongZeng. All rights reserved.
//

#import "ZYEncodeTool.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ZYEncodeTool

+ (NSString *)getmd5WithString:(NSString *)string {
    if (!string) {
        return nil;
    }
    
    const char *cStr = string.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *md5Str = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [md5Str appendFormat:@"%02x", result[i]];
    }
    return [md5Str lowercaseString];

}

+ (NSString *)getmd5WithData:(NSData *)data {
    if (!data) {
        return nil;
    }
    const char* original_str = (const char *)[data bytes];
    unsigned char digist[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), digist);NSMutableString* outPutStr = [NSMutableString string];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++) {
        [outPutStr appendFormat:@"%02x",digist[i]];
        
    }
    return [outPutStr lowercaseString];
}

+ (NSString *)jsonObjectConvertToJsonString:(id)object {
    NSError *error;
    NSData *jsonData;
    NSString *jsonString;
    if ([object isKindOfClass:[NSData class]]) {
        jsonData = (NSData *)object;
        jsonString = [jsonData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    else {
            jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
            if(error) {
                ZYLog(@"%@",error.localizedDescription);
            }
           jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    
    return jsonString;
}

+ (id)jsonDataConvertToDictionaryOrArray:(NSData *)jsonData {
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}

+ (NSString *)jsonObjectConvertToJSJsonString:(id)object {
    NSData *data;
    if ([object isKindOfClass:[NSData class]]) {
        data = object;
    }
    else {
        data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    }
    
    NSString *paraStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // 将JSON字符串转成无换行无空格字符串
    paraStr = [paraStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    paraStr = [paraStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    paraStr = [paraStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符使用
    paraStr = [paraStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return paraStr;
}

@end
