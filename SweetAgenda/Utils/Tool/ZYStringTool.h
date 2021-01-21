//
//  ZYStringTool.h
//  MyAddressBook
//
//  Created by ZyZl on 2017/8/15.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ZYInterceptStringType) {
    ZYInterceptStringTypeDefault = 0,   //sourceString 、 location and length
    ZYInterceptStringTypePromptImgName , // sourceString 
    ZYInterceptStringTypeFront,
    ZYInterceptStringTypeStern
};

@interface ZYStringTool : NSObject

+ (NSString *)dealwithFloatNumber:(NSString *)number;
+ (NSString *)dealwithAmountOfBalanceWithBalance:(NSString *)balance;
+ (NSString *)dealwithAmountOfBalanceWithBalance:(NSString *)balance accuracy:(NSInteger)accuracy;

//Delete the blank space from string
+ (NSString *)removeSpaceFromString:(NSString *)string;
+ (NSString *)removeWhitespaceAndNewlineCharacterSetFromString:(NSString *)string;

// Intercept the specified string
+ (NSString *)interceptsTheSpecifiedStringWithSourceString:(NSString *)sourcestring starts:(NSInteger)startchar stringLength:(NSInteger)charlength interceptType:(ZYInterceptStringType) interceptType;

//Compute the size of AttributedString
+ (CGFloat)computeAttributedStringSizeWithString:(NSAttributedString *)string tvWidth:(CGFloat)width;
+ (CGFloat)computerStringWidthWithString:(NSString *)string attribute:(NSDictionary *)dic maxWidth:(CGFloat)maxwidth;
+ (CGFloat)computeAttributedStringSizeWithTargetString:(NSString *)string attribute:(NSDictionary *)dic tvWidth:(CGFloat)width;

+ (NSDictionary *)computeWordCountsWithString:(NSString *)str;

//Delete specified char from source string
+ (NSString *)removeSpecifiedCharFromSourceString:(NSString *)sourcestr specifiedChar:(NSString *)theChar;

+ (NSString *)phoneNumberHiddenDisposeWithTargetStr:(NSString *)phonenumber;
+ (NSString *)cardHideHandle:(NSString *)cardnumber;

//Check whether a string is a phone number / IDCard / Email address
+ (BOOL)isPhoneNumber:(NSString *)str;
+ (BOOL)is11PhoneNumber:(NSString *)str;
+ (BOOL)isValidateIdentityCard: (NSString *)identityCard;
+ (BOOL)isEmail:(NSString *)str;
+ (BOOL)isPureInt:(NSString *)str;
+ (BOOL)isPureFloat:(NSString*)string;
+ (NSArray *)getWebsitesWithString:(NSString *)string;
+ (BOOL)isWebsitesWithString:(NSString *)string;

+ (BOOL)checkTargetStringIsNil:(NSString *)astring;
+ (BOOL)checkTargetStringIsValid:(NSString *)astring;
+ (BOOL)checkTargetStringIsNumber:(NSString *)astring;

+ (NSString *)obtainRandomStringWithBits:(int)bits;
+ (NSString *)replaceString:(NSString *)rstring removestring:(NSString *)rmstring targetString:(NSString *)tstring;
+ (NSString *)replaceOneToOneString:(NSString *)rstring removesRange:(NSRange)rmrange targetString:(NSString *)tstring;
+ (NSString *)replaceString:(NSString *)rstring removesRange:(NSRange)rmrange targetString:(NSString *)tstring;
+ (NSMutableArray *)seekSubStringArrayWithTarget:(NSString *)str partyString:(NSString *)partyStr;
+ (NSString *)joinArrayObjectsToString:(NSArray<NSString *> *)objects withMark:(NSString *)markstr;
+ (NSMutableDictionary *)arraySortByChineseSpellWithDatas:(NSArray *)datas;
+ (NSString *)firstSpellWithObject:(NSString *)object;
+ (NSMutableArray *)getObjectsSpellsWithObjects:(NSArray *)objects;
+ (NSString *)joinStringArray:(NSArray<NSString *>*)strarray;
+ (NSString *)objectSpellsWithObject:(NSString *)object;
+ (NSMutableArray *)containSubString:(NSString *)substr targetObjects:(NSArray <NSString *> *)ojects;
+ (NSString *)setFormatDistanceWithContent:(NSString *)distance;
+ (NSString *)joinMoreWithCountObject:(id)object limit:(NSInteger)limitnumber;
+ (NSString *)computeDistanceOfDoubleAddressWithLongitudeAndLatitudeOne:(NSDictionary *)onedic other:(NSDictionary *)otherdic;
+ (NSString *)computeKMDistanceOfDoubleAddressWithLongitudeAndLatitudeOne:(NSDictionary *)onedic other:(NSDictionary *)otherdic;
+ (BOOL)judgeAppVersionShouldUpdateWithDataFromAppStore:(NSString *)appversion minimumOsVersion:(NSString *)minimumOsVersion;
+ (NSMutableAttributedString *)appendImgAtHeadWithImgName:(id)img imgrect:(CGRect)imgrect string:(NSString *)string stringAttributes:( NSDictionary<NSAttributedStringKey, id> *)attrs;
+ (NSMutableAttributedString *)appendImgAtEndWithImgName:(id)img imgrect:(CGRect)imgrect string:(NSString *)string stringAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs;
+ (NSMutableAttributedString *)appendImgAtDoubleSideWithHeadImgName:(id)himg endImgName:(id)eimg headrect:(CGRect)himgrect endrect:(CGRect)eimgrect string:(NSString *)string stringAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs;
+ (NSMutableAttributedString *)convertHTMLStringWithString:(NSString *)str attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs;
+ (NSMutableArray *)analysisHTMLImageUrlsWithString:(NSString *)htmlstr;
+ (NSAttributedString *)analusisHTMLText:(NSString *)htmlstr;

+ (NSString *)obtainCustomLengthStringWithTargetString:(NSString *)str width:(CGFloat)width font:(NSInteger)font;
+ (NSString *)obtainBase64CodeStringFromImage:(UIImage *)image;
+ (NSString *)obtainBase64CodeStringFromData:(NSData *)data;
+ (NSString *)URLEncodedString:(NSString *)str;
+ (NSString *)URLDecodedString:(NSString *)str;
+ (NSString *)numberConvertToChineseWord:(id)number;

+ (CGFloat)configurationFontWithContent:(NSString *)content containerWidth:(CGFloat)width originalFont:(NSInteger)font;

@end
