//
//  AddCartView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/22.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "AddCartView.h"

@implementation AddCartView


+ (id)shareManager
{
    static AddCartView *m;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[AddCartView alloc] init];
    });
    return m;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat width = (WIDTH - 80 - 2*5)/2;
        CGRect frame = CGRectMake(80, HEIGHT-49+3, width, 43);
        self.frame = frame;
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.5;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [btn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(addCartAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [[[UIApplication sharedApplication] keyWindow ]addSubview:self];

    }
    return self;
}

- (void)show
{
    self.hidden = NO;
}

- (void)hidden
{
    self.hidden = YES;
}

+ (void)show
{
    [[self shareManager] show];
}

+ (void)hidden
{
    [[self shareManager]hidden];
}

- (void)addCartAction
{
    NSLog(@"加入购物车按钮被点击");
}
@end
