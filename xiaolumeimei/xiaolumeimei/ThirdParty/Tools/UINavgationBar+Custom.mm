//
//  UINavgationBar+Custom.m
//  UU
//
//  Created by changxm on 13-11-11.
//  Copyright (c) 2013年 王 家振. All rights reserved.
//

#import "UINavgationBar+Custom.h"

@implementation UINavigationBar (Customized)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)loadNavigationBar
{
    /*
    UIImage* backImg = nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        backImg = [UIImage imageNamed:@"title-128.png"];
    }
    else
    {
        backImg = [UIImage imageNamed:@"title.png"];
    }
    UIImage* normalImg = [UIImage imageWithCGImage:backImg.CGImage scale:2 orientation:UIImageOrientationUp];
    [self setBackgroundImage:normalImg forBarMetrics:UIBarMetricsDefault];
     */
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [self setBarTintColor:[UIColor colorWithRed:137.0/255.0 green:197.0/255.0 blue:182.0/255.0 alpha:1.0]];
    }
    else
    {
        [self setTintColor:[UIColor colorWithRed:137.0/255.0 green:197.0/255.0 blue:182.0/255.0 alpha:1.0]];
    }
    
}

- (void)loadBlackNavgationBar
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [self setBarTintColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    }
    else
    {
        [self setTintColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    }
}


@end
