//
//  BuyView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/22.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "BuyView.h"

@implementation BuyView

+ (id)shareManager
{
    static BuyView *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BuyView alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat width = (WIDTH - 80 - 2*5)/2;
        CGRect frame = CGRectMake(80+width+5, HEIGHT-49+3, width, 43);
        self.frame = frame;
        self.alpha = 0.5;
        self.backgroundColor = [UIColor grayColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [btn setTitle:@"立即购买" forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5;
        [btn addTarget:self action:@selector(buyAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

+ (void)createBuyView
{
    
}


- (void)buyViewShow
{
    self.hidden = NO;
}

- (void)buyViewHidden
{
    self.hidden = YES;
}

+ (void)buyViewShow
{
    [[self shareManager] buyViewShow];
}

+ (void)buyViewHidden
{
    [[self shareManager] buyViewHidden];
}

- (void)buyAction
{
    NSLog(@"立即购买按钮被点击~");
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
