//
//  Tool.h
//  适配
//
//  Created by c on 14-7-7.
//  Copyright (c) 2014年 c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tool : NSObject

+(CGSize)sizeOfStr:(NSString *)str andFont:(UIFont *)font andMaxSize:(CGSize)size andLineBreakMode:(NSLineBreakMode)mode;

+ (UIColor *) colorWithHexString: (NSString *)color;

+(NSString *)stringFromChURL:(NSString *)str;
@end











