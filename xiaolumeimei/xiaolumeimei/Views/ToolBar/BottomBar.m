//
//  BottomBar.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/8.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "BottomBar.h"

@implementation BottomBar
{
    
}
+ (id)shareManager
{
    static BottomBar * m = nil;
    if (!m) {
        m = [[BottomBar alloc] initWithFrame:CGRectMake(0, HEIGHT - 44, WIDTH, 44)];
    }
    return m;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)backBottomBar:(UIScrollView *)view
{
    
}

+ (void)backBottomBar:(UIScrollView *)view
{
    [[self shareManager]backBottomBar:view];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
