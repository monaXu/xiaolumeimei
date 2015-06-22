//
//  LoadingView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/18.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView
{
    UIActivityIndicatorView *_indicatorView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (id)shareManager
{
   static LoadingView *m = nil;
    if (!m) {
        m = [[LoadingView alloc] init];
    }
    return m;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, WIDTH/2, HEIGHT/4);
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.5;
        
        self.center = CGPointMake(WIDTH/2*3, HEIGHT/2);
        
        _indicatorView = [[UIActivityIndicatorView alloc] init];
        
        _indicatorView.frame = CGRectMake((WIDTH/2-50)/2, (HEIGHT/4-50)/2, 50, 50);

        [self addSubview:_indicatorView];
        
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

- (void)startAnimating
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    self.center = CGPointMake(WIDTH/2, HEIGHT/2);
    [UIView commitAnimations];
    [_indicatorView startAnimating];
}


- (void)stopAnimating
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    self.center = CGPointMake(WIDTH/2*3, HEIGHT/2);
    [UIView commitAnimations];
    [_indicatorView stopAnimating];
}

+ (void)startAnimating
{
    [[self shareManager] startAnimating];
}

+ (void)stopAnimating
{
    [[self shareManager]stopAnimating];
}

@end
