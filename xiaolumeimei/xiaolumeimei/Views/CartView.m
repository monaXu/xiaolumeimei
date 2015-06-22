//
//  CartView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/11.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "CartView.h"

@implementation CartView
{
    UIButton *_cartBtn;
    UIButton *_goodsCountBtn;
    CGRect selfFrame;
}

+ (id)shareManage
{
    static CartView *m = nil;
    if (!m)
    {
        m = [[CartView alloc] init];
    }
    return m;
}
- (id)initWithFrame:(CGRect)frame withCount:(NSString *)count
{
    self = [super initWithFrame:frame];
    count = @"1";
    if (self) {
        
        selfFrame = frame;
        self.frame = frame;
        self.alpha = 0.5;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.width/2;
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.5;
        
        [self createViewWithCount:count];
        
        
    }
    
    return self;
}

- (void)createViewWithCount:(NSString *)count
{
    CGFloat margin = 0;
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    CGFloat btnWidht = width - 2*margin;
    CGFloat btnHeight = height - 2*margin;
    _cartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cartBtn.backgroundColor = [UIColor redColor];
    _cartBtn.frame = CGRectMake(margin, margin, btnWidht, btnHeight);
    
    _cartBtn.layer.masksToBounds = YES;
    _cartBtn.layer.cornerRadius = btnHeight/2;
    
    
    [_cartBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_cartBtn addTarget:self action:@selector(gotoCartVC) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cartBtn];
    
    
    CGFloat goodsWidth = width/5;
    CGFloat goodsHeight = height/5;
    _goodsCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _goodsCountBtn.frame = CGRectMake(width/6*3, height/4*1, goodsWidth, goodsHeight);
    _goodsCountBtn.backgroundColor = [UIColor yellowColor];
    [_goodsCountBtn setTitle:count forState:UIControlStateNormal];
    _goodsCountBtn.userInteractionEnabled = NO;
    [_goodsCountBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _goodsCountBtn.layer.masksToBounds = YES;
    _goodsCountBtn.layer.cornerRadius = goodsHeight/2;
    [self addSubview:_goodsCountBtn];
    
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

+ (CartView *)CartViewWithFrame:(CGRect)frame withGoodsCount:(NSString *)count
{
    return [[self shareManage] initWithFrame:frame withCount:count];
}

- (void)viewShow
{
    self.hidden = NO;
}

- (void)viewHidden
{
    self.hidden = YES;
}

+ (void)viewShow
{
    [[self shareManage]viewShow];
}

+ (void)viewHidden
{
    [[self shareManage]viewHidden];
}

- (void)changeFrame:(CGRect)frame
{
    self.frame = frame;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
}

+ (void)changeFrame:(CGRect)frame
{
    [[self shareManage]changeFrame:frame];
}

- (void)gotoCartVC
{
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:UserName];
    if (userName) {
        _gotoCartCarVCBlock();
        return;
    }

    _gotoLoginVC();
}

- (void)firstFrame
{
    self.frame = selfFrame;
    self.layer.cornerRadius = selfFrame.size.width/2;
    
     _cartBtn.frame = CGRectMake(0, 0, selfFrame.size.width, selfFrame.size.height);
}

+ (void)firstFrame
{
    [[self shareManage] firstFrame];
}

- (void)secondFrame
{
    CGRect frame = CGRectMake(5, HEIGHT-49+3, 70, 43);
    self.frame = frame;
    
    self.layer.cornerRadius = 5;
    
    _cartBtn.frame = CGRectMake(13, 3, 54, 37);
    _cartBtn.layer.cornerRadius = 0;
    

}

+ (void)secondFrame
{
    [[self shareManage] secondFrame];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
