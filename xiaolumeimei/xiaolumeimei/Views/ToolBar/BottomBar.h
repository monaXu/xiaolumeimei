//
//  BottomBar.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/8.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomBar : UIToolbar

@property (nonatomic,copy) UIButton *carBtn;
@property (nonatomic,copy) UIButton *toTopBtn;

+ (void)backBottomBar:(UIScrollView *)view;

@end
