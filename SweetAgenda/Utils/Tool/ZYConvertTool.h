//
//  ZYConvertTool.h
//  MyNote
//
//  Created by ZyZl on 2017/8/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,dateConvertType) {
    ZYDefault = 0,
    ZYDate = 1,
    ZYDateAndTime = 2,
    ZYTimeDefault = 3,
    ZYTimeHourAndMinute = 4,
    ZYDateName,
    ZYDateYYMM,
    ZYDateMMDDTime,
    ZYDateDD,
    ZYDateYY,
    ZYDateAndHHMM,
    ZYDateMMDDHHMM,
    ZYDateMM
};

typedef NS_ENUM(NSInteger,controlType) {
    ZYTextField = 0,
    ZYTextView = 1
};

typedef NS_ENUM(NSInteger,ZYTimeStampType) {
    ZYTimeStampTypeString = 0,
    ZYTimeStampTypeInteger
};

@interface ZYConvertTool : NSObject

+ (NSString *)dateConvertToString:(NSDate *)date format:(dateConvertType)format;
+ (NSString *)nowDateConvertToStringWithFormat:(dateConvertType)format;
+ (NSDate *)getNowDateWithFormat:(dateConvertType)format;
+ (NSDate *)stringContvertToDate:(NSString *)dateStr format:(dateConvertType)format;
+ (NSString *)getDateDifferenceWithDateString:(NSString *)datestring;
+ (NSString *)getNextDayFromDateString:(NSString *)datestring dateType:(dateConvertType)type;
+ (NSString *)getDateStringAfterNowTimeInterval:(NSTimeInterval)secs fromat:(dateConvertType)format;
+ (NSString *)getNowTimeStamp;
+ (NSTimeInterval)getNowTimeStampIntervalSince1970;
+ (NSTimeInterval)getDateTimeStampIntervalWithDateStr:(NSString *)datestr format:(dateConvertType)format;
+ (NSString *)getDateTimeStampWithDateStr:(NSString *)datestr format:(dateConvertType)format;
+ (NSDate *)getDateFromTimeIntervalString:(NSTimeInterval)secs fromat:(dateConvertType)format;
+ (NSString *)getDateStringFromTimeIntervalString:(NSTimeInterval)secs fromat:(dateConvertType)format;

+ (NSMutableDictionary *)integerConvertToDateString:(NSInteger)seconds;
+ (NSString *)integerConvertToString:(NSInteger)integers;
+ (NSString *)boolConvertToString:(BOOL)abool;
+ (NSString *)obtainGradeWithPwd:(NSString *)apwd;
+ (BOOL)stringConvertToBool:(NSString *)boolStr;
+ (int)boolConvertToInt:(BOOL)abool;

+ (NSMutableDictionary *)getDayDifferenceWithDateString:(NSString *)datestring;
+ (NSString *)getDateDifferenceFromNowWithDateString:(NSString *)datestring;
+ (NSString *)getDateDifferentWithDateString:(NSString *)datestring;
+ (NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string controlType:(controlType)type;
+ (NSMutableAttributedString *)sharedTitleAttributedString:(NSString *)string;
+ (NSMutableAttributedString *)sharedDecriptionAttributedString:(NSString *)string;
+ (NSMutableAttributedString *)gradualChangeTextWithSourceString:(NSString *)sourceText font:(NSInteger)textFont oncePart:(float)progressNumber onceColor:(UIColor *)onceColor otherColor:(UIColor *)otherColor;
+ (NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string fontSize:(NSInteger)fontsize kernSzie:(NSInteger)ksize tcolor:(UIColor *)tcolor firstHeadIndent:(NSInteger)indent isHaveunderLine:(BOOL)isHaving  isZapFont:(BOOL)isZap;
+ (NSDateFormatter *)setupCustomDateFormatterWithFormat:(dateConvertType)format;
+ (NSString *)setFormatDateDifference:(NSString *)diff;
//+ (NSString *)computeDistanceOfDoubleLocation:(CLLocation *)location0 other:(CLLocation *)location1;

+ (NSString *)convertChineseWordWithIntegerNumber:(NSInteger)num;
+ (NSString *)formatDateStringWithSeconds:(NSInteger)seconds;
+ (CGFloat)fetchDeviceStatusBarHeight;

@end
