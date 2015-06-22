//
//  PhoneView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/18.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "PhoneView.h"

@implementation PhoneView

+(id)shareManager
{
    static PhoneView *m=nil;
    if (!m) {
        m = [[PhoneView alloc] init];
    }
    return m;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
       
        [self createView];
    }
    return self;
}

- (void)createView
{
    CGFloat margin = 5;
    CGFloat btnHeight = HEIGHT/15;
    CGFloat btnWidth = WIDTH - 2*(4*margin);
    CGFloat height = margin *2 + 2*btnHeight;
    //self.frame = CGRectMake(margin * 4, HEIGHT-height, btnWidth, height);
    self.frame = CGRectMake(margin * 4, HEIGHT, btnWidth, height);
    
    
    
    UIButton *numBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    numBtn.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    [numBtn setTitle:@"021-11011011" forState:UIControlStateNormal];
    [numBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    numBtn.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
    [numBtn addTarget:self action:@selector(callAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:numBtn];
    
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, btnHeight + margin, btnWidth, btnHeight);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
}

- (void)callAction
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"15868808227"];
    //            NSLog(@"str======%@",str);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (void)cancelAction
{
    CGFloat margin = 5;
    CGFloat btnHeight = HEIGHT/20;
    CGFloat btnWidth = WIDTH - 2*(4*margin);
    CGFloat height = margin *2 + 2*btnHeight;

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(margin * 4, HEIGHT, btnWidth, height);
    [UIView commitAnimations];
    
}
@end
