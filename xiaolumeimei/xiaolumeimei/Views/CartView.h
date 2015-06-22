//
//  CartView.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/11.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartView : UIView

+ (CartView *)CartViewWithFrame:(CGRect)frame withGoodsCount:(NSString *)count;

+ (void)viewShow;

+ (void)viewHidden;

+ (void)changeFrame:(CGRect)frame;

+ (void)firstFrame;

+ (void)secondFrame;

@property (nonatomic,copy) void (^gotoCartCarVCBlock)();
@property (nonatomic,copy) void (^gotoLoginVC)();

@end
