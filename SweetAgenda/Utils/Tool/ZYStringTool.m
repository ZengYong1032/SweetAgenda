//
//  ZYStringTool.m
//  MyAddressBook
//
//  Created by ZyZl on 2017/8/15.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYStringTool.h"
#import <CoreLocation/CoreLocation.h>

//#define kConvertStringWithInt(aint) [NSString stringWithFormat:@"%d",(aint)]
//
//#define kObtainRandomInt(starts,ends) ((int)(starts + (arc4random()%(ends - starts + 1))))
//#define kObtainRandomIntString(starts,ends) [NSString stringWithFormat:@"%d",kObtainRandomInt(starts,ends)]

@implementation ZYStringTool

+ (NSString *)dealwithAmountOfBalanceWithBalance:(NSString *)balance {
    
    
    return @"";
}

+ (NSString *)dealwithAmountOfBalanceWithBalance:(NSString *)balance accuracy:(NSInteger)accuracy {
    NSDecimalNumberHandler *roundDown = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundDown
                                       scale:accuracy
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    
    NSDecimalNumber *a = [[NSDecimalNumber decimalNumberWithString:balance] decimalNumberByRoundingAccordingToBehavior:roundDown];
    
    return [NSString stringWithFormat:@"%@",a];
}

+ (NSString *)removeSpecifiedCharFromSourceString:(NSString *)sourcestr specifiedChar:(NSString *)theChar {
    return [sourcestr stringByReplacingOccurrencesOfString:theChar withString:@""];
}

+ (NSString *)joinStringArray:(NSArray<NSString *>*)strarray {
    NSString *str = @"";
    for (NSString *st in strarray) {
        if (![ZYStringTool checkTargetStringIsNil:st]) {
            str = [str stringByAppendingString:st];
        }
    }
    
    return str;
}

+ (NSString *)removeSpaceFromString:(NSString *)string {
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (NSString *)removeWhitespaceAndNewlineCharacterSetFromString:(NSString *)string {
    if (string == nil || [string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    return [NSStringFormat(@"%@",string) stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)interceptsTheSpecifiedStringWithSourceString:(NSString *)sourcestring starts:(NSInteger)startchar stringLength:(NSInteger)charlength interceptType:(ZYInterceptStringType) interceptType {
    NSString *targetstring = @"http://images.juheapi.com/jztk/";
    NSString *resultString = @"";
    
    switch (interceptType) {
        case 0:
            resultString = [sourcestring substringWithRange:NSMakeRange(startchar, charlength)];
            break;
            
        case 1:
            resultString = [sourcestring substringFromIndex:[targetstring length]];
            break;
            
        case 2:
            resultString = [sourcestring substringToIndex:charlength];
            break;
            
        case 3:
            resultString = [sourcestring substringFromIndex:startchar];
            break;
            
        default:
            break;
    }
    
    return resultString;
}

+ (CGFloat)computeAttributedStringSizeWithString:(NSAttributedString *)string tvWidth:(CGFloat)width {
    if (![ZYStringTool checkTargetStringIsNil:string.string]) {
        NSRange range = NSMakeRange(0, string.length);
        // 获取该段attributedString的属性字典
        NSDictionary *dic = [string attributesAtIndex:0 effectiveRange:&range];
        // 计算文本的大小
        CGSize sizeToFit = [string.string boundingRectWithSize:CGSizeMake(width - 16.0, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
        // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
        // 用于计算文本绘制时占据的矩形块
        // 文本绘制时的附加选项
        // 文字的属性
        
        return sizeToFit.height + 16.0;
    }
    else {
            return 0;
        }
}

+ (BOOL)is11PhoneNumber:(NSString *)str {
    NSString * CM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(198)|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    NSString * CU = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    NSString * CT = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];

    BOOL res2 = [regextestcm evaluateWithObject:str];
    BOOL res3 = [regextestcu evaluateWithObject:str];
    BOOL res4 = [regextestct evaluateWithObject:str];
    
    if (res2 || res3 || res4) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (BOOL)isTelNumber:(NSString *)str {
    return ([self isPureInt:str] && (str.length == 11));
    
}

+ (BOOL)isPhoneNumber:(NSString *)str {
    NSString * MOBIL = @"^1(3[0-9]|4[579]|5[0-35-9]|6[0-9]|7[0-9]|8[0-9]|9[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    if ([regextestmobile evaluateWithObject:str] || [self is11PhoneNumber:str]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isValidateIdentityCard: (NSString *)identityCard {
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (BOOL)isEmail:(NSString *)str {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:str];
}

+ (BOOL)checkTargetStringIsNil:(NSString *)astring {
    if ((![ZYStringTool removeWhitespaceAndNewlineCharacterSetFromString:astring]) || [[ZYStringTool removeWhitespaceAndNewlineCharacterSetFromString:astring] isEqualToString:@""] || (!astring)) {
        return YES;
    }
    else {
            return NO;
        }
}

+ (BOOL)checkTargetStringIsValid:(NSString *)astring {
    return ![ZYStringTool checkTargetStringIsNil:astring];
}

+ (BOOL)isPureInt:(NSString *)str {
    NSScanner *scan = [NSScanner scannerWithString:str];
    int val;
    
    return ([scan scanInt:&val] && [scan isAtEnd]);
}

#pragma mark ---- Compute String Width Method ----
+ (CGFloat)computerStringWidthWithString:(NSString *)string attribute:(NSDictionary *)dic maxWidth:(CGFloat)maxwidth {
    CGFloat stringWidth = 0;
    
    CGSize stringsize = [string sizeWithAttributes:dic];
    
    if (stringsize.width > maxwidth) {
        stringWidth = maxwidth;
    }
    else {
        stringWidth = stringsize.width;
    }
    
    return stringWidth;
}

+ (CGFloat)computeAttributedStringSizeWithTargetString:(NSString *)string attribute:(NSDictionary *)dic tvWidth:(CGFloat)width {
    CGFloat __block hh = 0;
    if ([string containsString:@"\n"]) {
        BOOL haveline = ([dic valueForKey:NSParagraphStyleAttributeName] != nil);
        NSArray *words = [self seekSubStringArrayWithTarget:string partyString:@"\n"];
        [words enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *word = obj;
            if ([word isKindOfClass:[NSString class]]) {
                hh += (([self computeAttributedStringSizeWithString:[[NSAttributedString alloc] initWithString:word attributes:dic] tvWidth:width] - 16.0) + haveline*10.0);
            };
        }];
    }
    else {
        hh = [ZYStringTool computeAttributedStringSizeWithString:[[NSAttributedString alloc] initWithString:string attributes:dic] tvWidth:width];
    }
    
    return hh;
}

+ (NSDictionary *)computeWordCountsWithString:(NSString *)str {
    int count_EN = 0;
    int count_CN = 0;
    int count_ALL = 0;
    for (int i=0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5) {
            count_CN ++;
        }
        else {
            count_EN ++;
            
        }
    }
    count_ALL = (count_EN + count_CN);
    
    return @{@"Count_CN":kConvertStringWithInt(count_CN),@"Count_EN":kConvertStringWithInt(count_EN),@"Count_ALL":kConvertStringWithInt(count_ALL)};
}

//判断是否为浮点型：
+ (BOOL)isPureFloat:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

+ (BOOL)checkTargetStringIsNumber:(NSString *)astring {
    return (([ZYStringTool isPureInt:astring]) || ([ZYStringTool isPureFloat:astring]));
}

+ (BOOL)isChineseCharacter:(NSString *)string {
    
    if (string.length == 0) {        return NO;
        
    }
    
    unichar c = [string characterAtIndex:0];
    
    if (c >=0x4E00 && c <=0x9FA5)     {         return YES;//汉字
        
    } else {
        
        return NO;//英文
        
    }
}

+ (NSArray *)getWebsitesWithString:(NSString *)string {
    NSError *error;
    //    NSString *regulaStr = @"\\bhttps?://[a-zA-Z0-9\\-.]+ (?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    NSMutableArray *result = [NSMutableArray array];
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString *substringForMatch = [string substringWithRange:match.range];
        NSLog(@"%@",substringForMatch);
        [result addObject:substringForMatch];
    }
    return (NSArray *)result;
}

+ (BOOL)isWebsitesWithString:(NSString *)string {
    return ([ZYStringTool checkTargetStringIsValid:string] && [[self getWebsitesWithString:string] count]>0);
}

+ (NSString *)phoneNumberHiddenDisposeWithTargetStr:(NSString *)phonenumber {
    NSMutableString *result = [NSMutableString string];
    if (phonenumber.length > 7) {
        [result appendString:[phonenumber substringToIndex:3]];
        [result appendString:@"****"];
        [result appendString:[phonenumber substringFromIndex:7]];
    }
    else {
        [result appendString:phonenumber];
    }
    return result;
}

+ (NSString *)obtainRandomStringWithBits:(int)bits {
    NSString *str = @"";
    
//    NSArray *strs = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
//    for (int i=0; i<bits; i++)
//    {
//        NSString *numstr = kObtainRandomIntString(0, 9);
//        NSString *maxstr = [strs[kObtainRandomInt(0, 25)] uppercaseString];
//        NSString *lowstr = [strs[kObtainRandomInt(0, 25)] lowercaseString];
//        NSArray *chars = @[numstr,maxstr,lowstr];
//        str = [str stringByAppendingString:chars[kObtainRandomInt(0, 2)]];
//    }
    
    return str;
}

+ (NSString *)replaceString:(NSString *)rstring removestring:(NSString *)rmstring targetString:(NSString *)tstring {
    return [tstring stringByReplacingOccurrencesOfString:rmstring withString:rstring];
}

+ (NSString *)replaceOneToOneString:(NSString *)rstring removesRange:(NSRange)rmrange targetString:(NSString *)tstring {
    NSString *rs = @"";
    NSString *rmstr = @"";
    if ((rmrange.length + rmrange.location) > tstring.length) {
        for (int i=0; i<tstring.length - rmrange.location; i++) {
            rs = [rs stringByAppendingString:rstring];
        }
        rmstr = [tstring substringWithRange:NSMakeRange(rmrange.location, tstring.length - rmrange.location)];
    }
    else {
        for (int i=0; i<rmrange.length; i++) {
            rs = [rs stringByAppendingString:rstring];
        }
        rmstr = [tstring substringWithRange:rmrange];
    }
    return [tstring stringByReplacingOccurrencesOfString:rmstr withString:rs];
}

+ (NSString *)replaceString:(NSString *)rstring removesRange:(NSRange)rmrange targetString:(NSString *)tstring {
    NSString *rmstr = @"";
    if ((rmrange.length + rmrange.location) > tstring.length) {
        rmstr = [tstring substringWithRange:NSMakeRange(rmrange.location, tstring.length - rmrange.location)];
    }
    else {
        rmstr = [tstring substringWithRange:rmrange];
    }
    return [tstring stringByReplacingOccurrencesOfString:rmstr withString:rstring];
}

+ (NSMutableArray *)seekSubStringArrayWithTarget:(NSString *)str partyString:(NSString *)partyStr {
    NSArray *strs = [str componentsSeparatedByString:partyStr];
    NSMutableArray *substrs = [NSMutableArray arrayWithArray:strs];
    return substrs;
}

+ (NSString *)joinArrayObjectsToString:(NSArray<NSString *> *)objects withMark:(NSString *)markstr {
    NSMutableString __block *objectstring = [NSMutableString string];
    [objects enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![ZYStringTool checkTargetStringIsNil:obj]) {
            [objectstring appendString:obj];
            if (idx < ([objects count] - 1) ) {
                [objectstring appendString:markstr];
            }
        }
    }];
    return objectstring;
}

+ (NSString *)firstSpellWithObject:(NSString *)object {
    NSMutableString *ms = [[NSMutableString alloc] initWithString:object];
    //带声仄 //不能注释掉
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformMandarinLatin, NO)) {
        //NSLog(@"pinyin: ---- %@", ms);
    }
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformStripDiacritics, NO)) {
        NSString *bigStr = [ms uppercaseString]; // bigStr 是转换成功后的拼音
        NSString *cha = [bigStr substringToIndex:1];
        
        return cha;
    }
    return @"";
}

+ (NSString *)objectSpellsWithObject:(NSString *)object {
    NSMutableString *ms = [[NSMutableString alloc] initWithString:object];
    //带声仄 //不能注释掉
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformMandarinLatin, NO)) {
        //NSLog(@"pinyin: ---- %@", ms);
    }
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformStripDiacritics, NO)) {
        NSString *bigStr = [ms uppercaseString]; // bigStr 是转换成功后的拼音
//        NSMutableString *bigstr1 = [NSMutableString stringWithString:bigStr];
//        NSLog(@"bigStr = %@",[bigstr1 stringByReplacingOccurrencesOfString:@" " withString:@""]);
        
        return [bigStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return @"";
}

+ (NSMutableArray *)getObjectsSpellsWithObjects:(NSArray *)objects {
    NSMutableArray *spells = [NSMutableArray array];
    
    for (id object in objects) {
        if ([object isKindOfClass:[NSArray class]]) {
            NSMutableArray *subArray = [NSMutableArray array];
            
            for (NSString *objc in object) {
                [subArray addObject:[ZYStringTool objectSpellsWithObject:objc]];
            }
            
            [spells addObject:subArray];
        }
        else {
                [spells addObject:[ZYStringTool objectSpellsWithObject:object]];
            }
    }
    
    return spells;
}

+ (NSMutableDictionary *)arraySortByChineseSpellWithDatas:(NSArray *)datas {
    NSMutableArray *firstSpells = [NSMutableArray array];
//    NSMutableArray *sortDatas = [NSMutableArray array];
    NSMutableDictionary *sortDic = [NSMutableDictionary dictionary];
    NSMutableArray *groups = [NSMutableArray array];
    NSInteger k=0;
    for (NSString *chineseStr in datas) {
        k++;
        NSMutableString *ms = [[NSMutableString alloc] initWithString:chineseStr];
        //带声仄 //不能注释掉
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformMandarinLatin, NO)) {
            //NSLog(@"pinyin: ---- %@", ms);
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformStripDiacritics, NO)) {
            NSString *bigStr = [ms uppercaseString]; // bigStr 是转换成功后的拼音
            NSString *cha = [bigStr substringToIndex:1];
            
            NSMutableArray *array = [NSMutableArray arrayWithArray:[sortDic valueForKey:cha]];
            
            if (array && (array.count > 0)) {
                [array addObject:chineseStr];
                [sortDic setObject:array forKey:cha];
            }
            else
                {
                    array = [NSMutableArray arrayWithObject:chineseStr];
                    [sortDic setObject:array forKey:cha];
                    [firstSpells addObject:cha];
                }
        }
    }
    
    NSMutableArray *newss = [NSMutableArray arrayWithArray:[firstSpells sortedArrayUsingSelector:@selector(compare:)]];
    
    for (NSString *newSpell in newss) {
        [groups addObject:sortDic[newSpell]];
    }
    
    return [ZYStringTool dataSorting:groups spells:newss];
}

+ (NSMutableDictionary *)dataSorting:(NSMutableArray *)modelArr spells:(NSMutableArray *)spells {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableArray *indexArray = [[NSMutableArray alloc] init];
    for(int i='A';i<='Z';i++) {
           NSMutableArray *rulesArray = [[NSMutableArray alloc] init];
           NSString *str1=[NSString stringWithFormat:@"%c",i];
           for(int j=0;j<modelArr.count;j++) {
                  NSArray *citygroup = [modelArr objectAtIndex:j];//这个model 是我自己创建的 里面包含用户的姓名 手机号 和 转化成功后的首字母
                   NSString *key = [spells objectAtIndex:j];
                  if([key isEqualToString:str1]) {
                        [rulesArray addObject:citygroup];
                        [array addObject:citygroup];//把首字母相同的人物model 放到同一个数组里面
                        [spells removeObject:key];
                        [modelArr removeObject:citygroup];//model 放到 rulesArray 里面说明这个model 已经拍好序了 所以从总的modelArr里面删除
                         j--;
                     }
               }
            if (rulesArray.count >0) {
                [indexArray addObject:[NSString stringWithFormat:@"%c",i]]; //把大写字母也放到一个数组里面
            }
      }
    if (modelArr.count !=0) {
        NSMutableArray *others = [NSMutableArray array];
        for (NSArray *citys in modelArr) {
            [others addObjectsFromArray:citys];
        }

        [array addObject:others];
        [indexArray addObject:@"#"]; //把首字母不是A~Z里的字符全部放到 array里面 然后返回
    }
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:indexArray,@"Keys",array,@"CityGroup", nil];
}

+ (NSMutableArray *)containSubString:(NSString *)substr targetObjects:(NSArray <NSString *> *)ojects {
    NSMutableArray *ats = [NSMutableArray array];
    for (NSString *object in ojects) {
        if ([object containsString:substr] || [substr containsString:object]) {
            [ats addObject:object];
        }
    }
    return ats;
}

+ (NSString *)setFormatDistanceWithContent:(NSString *)distance {
    if ([distance containsString:@"km"]) {
        return distance;
    }
    else {
            return NSStringFormat(@"%@km",distance);
        }
}

+ (NSString *)joinMoreWithCountObject:(id)object limit:(NSInteger)limitnumber {
    NSString *newstr = @"";
    
    if ([object isKindOfClass:[NSNumber class]]) {
        if ([object integerValue] > limitnumber) {
            newstr = NSStringFormat(@"%ld+",limitnumber);
        }
        else {
            newstr = NSStringFormat(@"%@",object);;
        }
    }
    else if ([object isKindOfClass:[NSString class]]) {
        if ([object integerValue] > limitnumber) {
            newstr = NSStringFormat(@"%ld+",limitnumber);
        }
        else {
            newstr = object;
        }
    }
    
    return newstr;
}

+ (NSString *)computeKMDistanceOfDoubleAddressWithLongitudeAndLatitudeOne:(NSDictionary *)onedic other:(NSDictionary *)otherdic {
    NSString *distance = @"";
    CGFloat ddd = [[ZYStringTool computeDistanceOfDoubleAddressWithLongitudeAndLatitudeOne:onedic other:otherdic]  floatValue]/1000.0;
    if (ddd >= 1) {
        distance = NSStringFormat(@"%.0f",ddd);
    }
    else {
        distance = NSStringFormat(@"%.2f",ddd);
    }
    
    return distance;
}

+ (NSString *)computeDistanceOfDoubleAddressWithLongitudeAndLatitudeOne:(NSDictionary *)onedic other:(NSDictionary *)otherdic {
    NSString *distance = @"";
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:[onedic[@"Latitude"] floatValue] longitude:[onedic[@"Longitude"] floatValue]];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:[otherdic[@"Latitude"] floatValue] longitude:[otherdic[@"Longitude"] floatValue]];
    
    CGFloat ddd = [location1 distanceFromLocation:location2];
    distance = NSStringFormat(@"%f",ddd);
    
    return distance;
}

+ (BOOL)judgeAppVersionShouldUpdateWithDataFromAppStore:(NSString *)appversion  minimumOsVersion:(NSString *)minimumOsVersion {
    return (![kAPPVersion isEqualToString:appversion] && [ZYStringTool appVersionIsLittleThanVersionFromAppStore:appversion] && ([kCurrentDeviceSystemVersion floatValue] >= [minimumOsVersion floatValue]));
}

+ (BOOL)appVersionIsLittleThanVersionFromAppStore:(NSString *)appversion {
    NSMutableArray *appversions = [ZYStringTool seekSubStringArrayWithTarget:kAPPVersion partyString:@"."];
    NSMutableArray *appstoreversions = [ZYStringTool seekSubStringArrayWithTarget:appversion partyString:@"."];
//    NSString *appversionstr = @"";
//    NSString *appstoreversionstr = @"";
    
    NSInteger appvcount = appversions.count;
    NSInteger appstorevcount = appstoreversions.count;
    
    for (int i=0; i<MIN(appvcount, appstorevcount); i++) {
        NSInteger app = [appversions[i] integerValue];
        NSInteger appstore = [appstoreversions[i] integerValue];
        if (app < appstore) {
            return YES;
        }
        else if(app > appstore) {
            return NO;
        }
    }
    
    if (appvcount < appstorevcount) {
        return YES;
    }
    else {
        return NO;
    }
//
//    int i=0;
//    for (NSString *vstr in appversions)
//    {
//        appversionstr = [appversionstr stringByAppendingString:vstr];
//        if (i==0)
//        {
//            appversionstr = [appversionstr stringByAppendingString:@"."];
//        }
//        i++;
//    }
//    int k=0;
//    for (NSString *vstr in appstoreversions)
//    {
//        appstoreversionstr = [appstoreversionstr stringByAppendingString:vstr];
//        if (k==0)
//        {
//            appstoreversionstr = [appstoreversionstr stringByAppendingString:@"."];
//        }
//        k++;
//    }
//
//    NSLog(@"appversionstr = %@ \n appstoreversionstr = %@",appversionstr,appstoreversionstr);
//
//    return ([appversionstr floatValue] < [appstoreversionstr floatValue]);
}

/*
+ (NSString *)dealwithName:(NSString *)namestr {
    NSInteger strlength = [namestr length];
    NSString *str = @"";
    if (strlength > 2) {
        NSString *replacestr = @"";
        for (int i=0; i<(strlength - 2); i++) {
            replacestr = [replacestr stringByAppendingString:@"*"];
        }
        str = [namestr stringByReplacingCharactersInRange:NSMakeRange(1, strlength - 2) withString:replacestr];
    }
    else if (strlength == 2) {
        str = [namestr stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@"*"];
    }
    else {
        str = namestr;
    }
    
    return str;
}
 */

+ (NSMutableAttributedString *)appendImgAtDoubleSideWithHeadImgName:(id)himg endImgName:(id)eimg headrect:(CGRect)himgrect endrect:(CGRect)eimgrect string:(NSString *)string stringAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs {
    NSTextAttachment *htextAttachment = [NSTextAttachment new];
    UIImage *himgobject;
    if ([himg isKindOfClass:[NSString class]]) {
        himgobject = IMGBYNAME(himg);
    }
    else if ([himg isKindOfClass:[UIImage class]]) {
        himgobject = himg;
    }
    
    [htextAttachment setImage:himgobject];
    htextAttachment.bounds = himgrect;
    
    NSTextAttachment *etextAttachment = [NSTextAttachment new];
    UIImage *eimgobject;
    if ([eimg isKindOfClass:[NSString class]]) {
        eimgobject = IMGBYNAME(eimg);
    }
    else if ([eimg isKindOfClass:[UIImage class]]) {
        eimgobject = eimg;
    }
    
    [etextAttachment setImage:eimgobject];
    etextAttachment.bounds = eimgrect;
    
    NSMutableAttributedString *objectstr = [NSMutableAttributedString new];
    [objectstr appendAttributedString:[NSAttributedString attributedStringWithAttachment:htextAttachment]];
    [objectstr appendAttributedString:[[NSAttributedString alloc] initWithString:string attributes:attrs]];
    [objectstr appendAttributedString:[NSAttributedString attributedStringWithAttachment:etextAttachment]];
    
    return objectstr;
}

+ (NSMutableAttributedString *)appendImgAtHeadWithImgName:(id)img imgrect:(CGRect)imgrect string:(NSString *)string stringAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs {
    NSTextAttachment *textAttachment = [NSTextAttachment new];
    UIImage *imgobject;
    if ([img isKindOfClass:[NSString class]]) {
        imgobject = IMGBYNAME(img);
    }
    else if ([img isKindOfClass:[UIImage class]]) {
        imgobject = img;
    }
    
    [textAttachment setImage:imgobject];
    textAttachment.bounds = imgrect;
    
    NSMutableAttributedString *objectstr = [NSMutableAttributedString new];
    [objectstr appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];
    [objectstr appendAttributedString:[[NSAttributedString alloc] initWithString:string attributes:attrs]];
    
    return objectstr;
}

+ (NSMutableAttributedString *)appendImgAtEndWithImgName:(id)img imgrect:(CGRect)imgrect string:(NSString *)string stringAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs {
    NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:string attributes:attrs];
    NSTextAttachment *textAttachment = [NSTextAttachment new];
    UIImage *imgobject;
    if ([img isKindOfClass:[NSString class]]) {
        imgobject = IMGBYNAME(img);
    }
    else if ([img isKindOfClass:[UIImage class]]) {
        imgobject = img;
    }
    [textAttachment setImage:imgobject];
    textAttachment.bounds = imgrect;
    [astr appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];
    
    return astr;
}

+ (NSMutableAttributedString *)appendLineOnWitherSideOfWords:(NSString *)word stringAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs {
    NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:@"123456" attributes:@{NSFontAttributeName:attrs[NSFontAttributeName],NSForegroundColorAttributeName:kWhiteColor,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:kCustomGrayColor(130.0/255, 1.0)}];
    
    [astr appendAttributedString:[[NSAttributedString alloc] initWithString:word attributes:attrs]];
    
    NSMutableAttributedString *astr1 = [[NSMutableAttributedString alloc] initWithString:@"123456" attributes:@{NSFontAttributeName:attrs[NSFontAttributeName],NSForegroundColorAttributeName:kWhiteColor,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:kCustomGrayColor(130.0/255, 1.0)}];
    
    [astr appendAttributedString:astr1];
    
//    NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:NSStringFormat(@"123456 %@ 123456",word) attributes:attrs];
//    [astr setAttributes:@{NSForegroundColorAttributeName:kWhiteColor,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:kCustomGrayColor(130.0/255, 1.0)} range:NSMakeRange(0, 6)];
//    [astr setAttributes:@{NSForegroundColorAttributeName:kWhiteColor,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:kCustomGrayColor(130.0/255, 1.0)} range:NSMakeRange(8 + word.length, 6)];
    
    return astr;
}

+ (NSMutableAttributedString *)convertHTMLStringWithString:(NSString *)str attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs {
    NSMutableAttributedString *ats = [[NSMutableAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    [ats addAttributes:attrs range:NSMakeRange(0, ats.length)];
    return ats;
}

+ (NSMutableArray *)analysisHTMLImageUrlsWithString:(NSString *)htmlstr {
    NSMutableArray *imgsarr = [NSMutableArray array];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<img\\s[^>]*/>" options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
    NSArray *result = [regex matchesInString:htmlstr options:NSMatchingReportCompletion range:NSMakeRange(0, htmlstr.length)];
    
    for (NSTextCheckingResult *item in result) {
        NSString *imghtml = [htmlstr substringWithRange:[item rangeAtIndex:0]];
        
        NSArray *tmparray = nil;
        if ([imghtml rangeOfString:@"src=\""].location != NSNotFound) {
            tmparray = [imghtml componentsSeparatedByString:@"src=\""];
        }
        else if ([imghtml rangeOfString:@"src="].location != NSNotFound) {
            tmparray = [imghtml componentsSeparatedByString:@"src="];
        }
        
        if (tmparray.count >= 2) {
            NSString *src = tmparray[1];
            
            NSUInteger loc = [src rangeOfString:@"\""].location;
            if (loc != NSNotFound) {
                src = [src substringToIndex:loc];
                [imgsarr addObject:src];
            }
        }
    }
    
    return imgsarr;
}

+ (NSAttributedString *)analusisHTMLText:(NSString *)htmlstr {
    if ([self checkTargetStringIsNil:htmlstr]) {
        return [NSAttributedString new];
    }
    
    NSData *data = [htmlstr dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSAttributedString *html = [[NSAttributedString alloc]initWithData:data
                                                               options:options
                                                    documentAttributes:nil
                                                                 error:nil];
    return html;
}

+ (NSString *)obtainCustomLengthStringWithTargetString:(NSString *)str width:(CGFloat)width font:(NSInteger)font {
    CGFloat ww = 0;
    NSString *str0 = [str copy];
    while (ww < width) {
        str0 = [str0 stringByAppendingString:str];
        ww = [ZYStringTool computerStringWidthWithString:str0 attribute:@{NSFontAttributeName:SYSTEMFONT(font)} maxWidth:kScreenWidth];
    }
    return str0;
}

+ (NSString *)cardHideHandle:(NSString *)cardnumber {
    NSInteger strlength = [cardnumber length];
    NSString *str = @"";
    if (strlength > 4) {
        NSString *replacestr = @"";
        for (int i=0; i<(strlength - 4); i++) {
            replacestr = [replacestr stringByAppendingString:@"*"];
        }
        str = [cardnumber stringByReplacingCharactersInRange:NSMakeRange(0, strlength - 4) withString:replacestr];
    }
    else {
        str = cardnumber;
    }
    
    return str;
}

+ (NSString *)obtainBase64CodeStringFromImage:(UIImage *)image {
    if (image == nil) {
        return @"";
    }
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    NSString *encodedImageStr = [self obtainBase64CodeStringFromData:data];
    
    return encodedImageStr;
}

+ (NSString *)obtainBase64CodeStringFromData:(NSData *)data {
    if (data == nil) {
        return @"";
    }
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

+ (NSString *)URLEncodedString:(NSString *)str {
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedString = [kConvertValueToString(str) stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodedString;
}

+ (NSString *)URLDecodedString:(NSString *)str {
    NSString *decodedString = [kConvertValueToString(str) stringByRemovingPercentEncoding];
    return decodedString;
}

+ (NSString *)numberConvertToChineseWord:(id)number {
    NSInteger index = [number integerValue];
    NSArray *words = @[@"零",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十"];
    if (index >= words.count) {
        return @"";
    }
    
    return words[index];
}

+ (NSString *)dealwithFloatNumber:(NSString *)number {
    if (number && ([ZYStringTool isPureFloat:number] || [ZYStringTool isPureInt:number])) {
        NSArray *words = [ZYStringTool seekSubStringArrayWithTarget:number partyString:@"."];
        NSString *firstNum = @"";
        NSString *otherNum = @"";
        if (words.count == 2) {
            firstNum = words.firstObject;
            otherNum = words.lastObject;
        }
        else if (words.count == 1) {
            return words.firstObject;
        }
        else {
            firstNum = number;
        }
        
        CGFloat fnum = [number floatValue];
        NSInteger inum = [firstNum floatValue];
        if (inum == fnum) {
            return firstNum;
        }
        else {
            float onefNum = [NSStringFormat(@"%@.%@",firstNum,[otherNum substringWithRange:NSMakeRange(0, 1)]) floatValue];
            if (onefNum == fnum) {
                return NSStringFormat(@"%@.%@",firstNum,[otherNum substringWithRange:NSMakeRange(0, 1)]);
            }
             return NSStringFormat(@"%@.%@",firstNum,[otherNum substringWithRange:NSMakeRange(0, 2)]);
        }
    }
    return @"0";
}

+ (CGFloat)configurationFontWithContent:(NSString *)content containerWidth:(CGFloat)width originalFont:(NSInteger)font {
    CGFloat thefont = font*1.0;
    CGFloat contentWidth = [ZYStringTool computerStringWidthWithString:kConvertValueToString(content) attribute:@{NSFontAttributeName:SYSTEMFONT(font)} maxWidth:MAXFLOAT];
    while (contentWidth > width) {
        thefont -= 0.5;
        contentWidth = [ZYStringTool computerStringWidthWithString:kConvertValueToString(content) attribute:@{NSFontAttributeName:SYSTEMFONT(thefont)} maxWidth:MAXFLOAT];
    }
    
    return MAX(font*0.1, thefont);
}

@end
