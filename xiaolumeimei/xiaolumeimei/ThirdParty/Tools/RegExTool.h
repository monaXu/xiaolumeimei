//
//  RegExTool.h
//  UU
//
//  Created by 王 家振 on 13-11-2.
//  Copyright (c) 2013年 王 家振. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegExTool : NSObject

// 手机号码验证
+ (BOOL) isMobileNumber:(NSString* )mobileNum;

// 邮箱验证
+ (BOOL) isValidateEmail:(NSString* )mailStr;

// 电话号码验证
+ (BOOL) isValidateTelNumber:(NSString* )number;

// 数字验证
+ (BOOL) isValidateNumber:(NSString* )number;

// 是否带连字符的11位数
+ (BOOL) isElevenNumber:(NSString *)number;
+(BOOL)currentNetwork;
+(BOOL)isValidatePassword:(NSString *)password;
@end
