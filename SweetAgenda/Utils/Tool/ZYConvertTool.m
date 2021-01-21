//
//  ZYConvertTool.m
//  MyNote
//
//  Created by ZyZl on 2017/8/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYConvertTool.h"

@implementation ZYConvertTool

+ (NSString *)dateConvertToString:(NSDate *)date format:(dateConvertType)format {
    return [[self setupCustomDateFormatterWithFormat:format] stringFromDate:date];
}

+ (NSDate *)stringContvertToDate:(NSString *)dateStr format:(dateConvertType)format {
    return [[self setupCustomDateFormatterWithFormat:format] dateFromString:dateStr];
}

+ (NSString *)nowDateConvertToStringWithFormat:(dateConvertType)format {
    return [[self setupCustomDateFormatterWithFormat:format] stringFromDate:[NSDate date]];
}

+ (NSDate *)getNowDateWithFormat:(dateConvertType)format  {
    return [[self setupCustomDateFormatterWithFormat:format] dateFromString:[self nowDateConvertToStringWithFormat:format]];
}

+ (NSString *)getDateStringAfterNowTimeInterval:(NSTimeInterval)secs fromat:(dateConvertType)format {
    return [[self setupCustomDateFormatterWithFormat:format] stringFromDate:[[NSDate alloc] initWithTimeIntervalSinceNow:secs]];
}

+ (NSDateFormatter *)setupCustomDateFormatterWithFormat:(dateConvertType)format {
    NSString *formatStr = @"";
    switch (format) {
        case 0:
            formatStr = @"yyyy-MM-dd HH:mm:ss zzz";
            break;
            
        case 1:
            formatStr = @"yyyy-MM-dd";
            break;
            
        case 2:
            formatStr = @"yyyy-MM-dd HH:mm:ss";
            break;
            
        case 3:
            formatStr = @"HH:mm:ss";
            break;
            
        case 4:
            formatStr = @"HH:mm";
            break;
            
        case 5:
            formatStr = @"yyyyMMddHHmmss";
            break;
            
        case 6:
            formatStr = @"yyyy-MM";
            break;
            
        case 7:
            formatStr = @"MM-dd HH:mm:ss";
            break;
            
        case 8:
            formatStr = @"dd";
            break;
            
        case 9:
            formatStr = @"yyyy";
            break;
            
        case 10:
            formatStr = @"yyyy-MM-dd HH:mm";
            break;
            
        case 11:
            formatStr = @"MM-dd HH:mm";
            break;
            
        case ZYDateMM:
            formatStr = @"MM";
            break;
            
        default:
            formatStr = @"yyyyMMddHHmm";
            break;
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatStr];
    return dateFormat;
}

+ (NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string controlType:(controlType)type {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (type == ZYTextView) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 2.0;
        paragraphStyle.paragraphSpacing = 4.0;
        paragraphStyle.firstLineHeadIndent = 30.0;
        
        [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributeString.length)];
        [attributeString addAttributes:@{NSFontAttributeName:SYSTEMFONT(16),NSKernAttributeName:@(2),NSUnderlineStyleAttributeName:@(NSUnderlinePatternDot | NSUnderlineStyleSingle),NSUnderlineColorAttributeName:kCyanColor,NSForegroundColorAttributeName:kBlackColor} range:NSMakeRange(0, attributeString.length)];
    }
    else {
        [attributeString addAttributes:@{NSFontAttributeName:SYSTEMFONT(15),NSForegroundColorAttributeName:kGray2Color,NSLigatureAttributeName:@(1),NSTextEffectAttributeName:NSTextEffectLetterpressStyle} range:NSMakeRange(0, attributeString.length)];
    }
    
    return attributeString;
}

+ (NSMutableAttributedString *)sharedTitleAttributedString:(NSString *)string {
    NSMutableAttributedString *mats = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:15],NSForegroundColorAttributeName :kBlackColor,NSKernAttributeName:@(0),NSStrokeWidthAttributeName:@(-2),NSStrokeColorAttributeName:kCustomColor(96, 244, 223, 1.0)}];
    
    return mats;
}

+ (NSMutableAttributedString *)sharedDecriptionAttributedString:(NSString *)string {
    return [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:SYSTEMFONT(16),NSForegroundColorAttributeName:kCyanColor}];
}

+ (NSString *)getDateDifferenceFromNowWithDateString:(NSString *)datestring {
    NSDate *theDate = [self stringContvertToDate:datestring format:ZYDateAndTime];
    NSDate *nowdate = [NSDate date];//[self nowBeiJingDate];
    return NSStringFormat(@"%f",[theDate timeIntervalSinceDate:nowdate]);
}

+ (NSString *)getDateDifferenceWithDateString:(NSString *)datestring {
    NSDate *theDate = [self stringContvertToDate:datestring format:ZYDate];
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy"];
    
    return NSStringFormat(@"%ld",([[formatter stringFromDate:nowDate] integerValue] - [[formatter stringFromDate:theDate] integerValue] + 1));
}

+ (NSString *)getDateDifferentWithDateString:(NSString *)datestring {
    NSDate *theDate = [self stringContvertToDate:datestring format:ZYDateAndTime];
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return NSStringFormat(@"%ld",([[formatter stringFromDate:nowDate] integerValue] - [[formatter stringFromDate:theDate] integerValue]));
}

+ (NSMutableDictionary *)getDayDifferenceWithDateString:(NSString *)datestring {
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
    NSDate *theDate = [self stringContvertToDate:datestring format:ZYDate];
    NSDate *nowDate = [self getNowDateWithFormat:ZYDate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy"];
    NSString *nyy = [formatter stringFromDate:nowDate];
    [formatter setDateFormat:@"MM"];
    NSString *mm = [formatter stringFromDate:theDate];
    [formatter setDateFormat:@"dd"];
    NSString *dd = [formatter stringFromDate:theDate];
    
    NSDate *nowtheDate;
    
    nowtheDate = [self stringContvertToDate:NSStringFormat(@"%@-%@-%@",nyy,mm,dd) format:ZYDate];
    
    if ([nowtheDate timeIntervalSinceDate:nowDate] < 0) {
        [results setObject:@"YES" forKey:@"isPassing"];
        nowtheDate = [self stringContvertToDate:NSStringFormat(@"%ld-%@-%@",([nyy integerValue] +1),mm,dd) format:ZYDate];
    }
    else {
        [results setObject:@"NO" forKey:@"isPassing"];
    }
    
    [results setObject:NSStringFormat(@"%.f",([nowtheDate timeIntervalSinceDate:nowDate] / (24 * 60 * 60))) forKey:@"Interval"];
    
    return results;
}

+ (NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string fontSize:(NSInteger)fontsize kernSzie:(NSInteger)ksize tcolor:(UIColor *)tcolor firstHeadIndent:(NSInteger)indent isHaveunderLine:(BOOL)isHaving isZapFont:(BOOL)isZap {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    if (indent > 0) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 1.0;
        paragraphStyle.paragraphSpacing = 1.0;
        paragraphStyle.firstLineHeadIndent = indent;
        [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributeString.length)];
    }
    
    [attributeString addAttributes:isHaving ? @{NSFontAttributeName:(isZap ? [UIFont fontWithName:@"Zapfino" size:fontsize] : SYSTEMFONT(fontsize)),NSKernAttributeName:@(ksize),NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:kGray2Color,NSForegroundColorAttributeName:tcolor} : @{NSFontAttributeName:(isZap ? [UIFont fontWithName:@"Zapfino" size:fontsize] : SYSTEMFONT(fontsize)),NSKernAttributeName:@(ksize),NSForegroundColorAttributeName:tcolor} range:NSMakeRange(0, attributeString.length)];
    return attributeString;
}

+ (NSMutableAttributedString *)gradualChangeTextWithSourceString:(NSString *)sourceText font:(NSInteger)textFont oncePart:(float)progressNumber onceColor:(UIColor *)onceColor otherColor:(UIColor *)otherColor {
    NSMutableAttributedString *masStr = [[NSMutableAttributedString alloc] init];
    if (progressNumber < 1.0) {
        NSString *onces = [sourceText substringWithRange:NSMakeRange(0, (NSInteger)(sourceText.length * progressNumber))];
        NSMutableAttributedString *onceStr = [[NSMutableAttributedString alloc] initWithString:onces];
        [onceStr addAttributes:@{NSFontAttributeName:SYSTEMFONT(textFont),NSForegroundColorAttributeName:onceColor} range:NSMakeRange(0, onceStr.length)];
        NSString *others = [sourceText substringWithRange:NSMakeRange((NSInteger)(sourceText.length * progressNumber), (NSInteger)(sourceText.length - ((NSInteger)(sourceText.length * progressNumber))))];
        NSMutableAttributedString *otherStr = [[NSMutableAttributedString alloc] initWithString:others];
        [otherStr addAttributes:@{NSFontAttributeName:SYSTEMFONT(textFont),NSForegroundColorAttributeName:otherColor} range:NSMakeRange(0,otherStr.length)];
        
        [masStr appendAttributedString:onceStr];
        [masStr appendAttributedString:otherStr];
    }
    else {
        NSMutableAttributedString *onceA = [[NSMutableAttributedString alloc] initWithString:sourceText];
        [onceA addAttributes:@{NSFontAttributeName:SYSTEMFONT(textFont),NSForegroundColorAttributeName:onceColor} range:NSMakeRange(0, sourceText.length)];
        [masStr appendAttributedString:onceA];
    }
    
    return masStr;
}

+ (NSString *)integerConvertToString:(NSInteger)integers {
    return [NSString stringWithFormat:@"%ld",integers];
}

+ (NSString *)getNextDayFromDateString:(NSString *)datestring dateType:(dateConvertType)type {
    NSDate *thedate = [self stringContvertToDate:datestring format:ZYDateAndTime];
    NSDate *newdate = [NSDate dateWithTimeInterval:(24*60*60.0) sinceDate:thedate];
    
    return [ZYConvertTool dateConvertToString:newdate format:type];
}

+ (NSMutableDictionary *)integerConvertToDateString:(NSInteger)seconds {
    NSMutableDictionary *timeDictionary = [NSMutableDictionary dictionary];
    
    NSInteger hour = seconds/3600;
    NSString *hourStr = hour >= 10 ? [self integerConvertToString:hour] : NSStringFormat(@"0%ld",hour);
    NSInteger minutes = (seconds%3600)/60;
    NSString *minuteStr = minutes >=10 ? [self integerConvertToString:minutes] : NSStringFormat(@"0%ld",minutes);
    NSInteger secondes = seconds%60;
    NSString *secondStr = secondes >=10 ?[self integerConvertToString:secondes] : NSStringFormat(@"0%ld",secondes);
    
    [timeDictionary setValue:hourStr forKey:@"Hours"];
    [timeDictionary setValue:minuteStr forKey:@"Minutes"];
    [timeDictionary setValue:secondStr forKey:@"Seconds"];
    
    return [timeDictionary copy];
}

+ (NSString *)formatDateStringWithSeconds:(NSInteger)seconds {
    NSDictionary *timeDic = [self integerConvertToDateString:seconds];
    return NSStringFormat(@"%@:%@:%@",timeDic[@"Hours"],timeDic[@"Minutes"],timeDic[@"Seconds"]);
}

+ (NSString *)boolConvertToString:(BOOL)abool {
    return abool ? @"1":@"0";
}

+ (int)boolConvertToInt:(BOOL)abool {
    return abool ? 1:0;
}

+ (BOOL)stringConvertToBool:(NSString *)boolStr {
    return (![boolStr isEqualToString:@"0"]);
}

+ (NSString *)obtainGradeWithPwd:(NSString *)apwd {
    NSString *grades = @"";
    NSInteger numbers = [apwd length];
    
    if (numbers <=16 && numbers >=10 ) {
        grades = @"高";
    }
    else if (numbers <= 6) {
        grades = @"低";
    }
    else {
        grades = @"中";
    }
    
    return grades;
}

+ (NSString *)setFormatDateDifference:(NSString *)diff {
    NSInteger cd = (-[diff integerValue]);
    NSString *diffstr = @"";
    if (cd <= 60) {
        diffstr = NSStringFormat(@"%ld秒",cd);
    }
    else if (cd > 60 && cd < 3600) {
        diffstr = NSStringFormat(@"%ld分钟",(cd - cd%60)/60);
    }
    else if (cd >= 3600 && cd < 86400) {
        diffstr = NSStringFormat(@"%ld小时",(cd - cd%3600)/3600);
    }
    else {
        diffstr = NSStringFormat(@"%ld天",(cd - cd%86400)/86400);
    }
    return diffstr;
}

//+ (NSString *)computeDistanceOfDoubleLocation:(CLLocation *)location0 other:(CLLocation *)location1 {
//    return NSStringFormat(@"%.2f",[location0 distanceFromLocation:location1]/1000.0);
//}

+ (NSString *)getNowTimeStamp {
    NSInteger nowtimestamp = [[NSDate date] timeIntervalSince1970];
    
    return kConvertStringWithInteger(nowtimestamp);
}

+ (NSTimeInterval)getNowTimeStampIntervalSince1970 {
    return [[NSDate date] timeIntervalSince1970];
}

+ (NSString *)getDateTimeStampWithDateStr:(NSString *)datestr format:(dateConvertType)format {
    return NSStringFormat(@"%.0f",[ZYConvertTool getDateTimeStampIntervalWithDateStr:datestr format:format]);
}

+ (NSTimeInterval)getDateTimeStampIntervalWithDateStr:(NSString *)datestr format:(dateConvertType)format {
    NSDate *timedate = [ZYConvertTool stringContvertToDate:datestr format:format];
    return [timedate timeIntervalSince1970];
}

+ (NSString *)getDateStringFromTimeIntervalString:(NSTimeInterval)secs fromat:(dateConvertType)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:secs];
    
    return [self dateConvertToString:date format:format];
}

+ (NSDate *)getDateFromTimeIntervalString:(NSTimeInterval)secs fromat:(dateConvertType)format {
    return [self stringContvertToDate:[self getDateStringFromTimeIntervalString:secs fromat:format] format:format];
}

+ (NSString *)convertChineseWordWithIntegerNumber:(NSInteger)num {
    if (num <= 20) {
        NSArray *words = @[@"零",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        return words[num];
    }
    return @"";
}

+ (CGFloat)fetchDeviceStatusBarHeight {
    CGFloat statusBarHeight = 0.f;
    if (@available(iOS 13.0, *)) {
        statusBarHeight = kApplication.keyWindow.windowScene.statusBarManager.statusBarFrame.size.height;
    }
    else {
        statusBarHeight = kApplication.statusBarFrame.size.height;
    }
    return statusBarHeight;
}

@end
