//
//  HeaderView2.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/12.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "HeaderView2.h"

@implementation HeaderView2
{
    UILabel *titleLabel;
    UILabel *timeLabel;
    UIImageView *imgV;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat titleWidth = WIDTH/5;
        CGFloat imageWidth = WIDTH/20;
        CGFloat timeWidth = WIDTH/2;
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, titleWidth/5*6, 20)];
        titleLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:titleLabel];
        
        imgV = [[UIImageView alloc] initWithFrame:CGRectMake(titleWidth *2, 15, imageWidth, imageWidth)];
        imgV.clipsToBounds = YES;
        imgV.layer.cornerRadius = imageWidth/2;
        imgV.backgroundColor = [UIColor redColor];
        [self addSubview:imgV];
        
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgV.frame.origin.x + imgV.frame.size.width, 15, timeWidth, imageWidth)];
        timeLabel.text = @"还剩02天01时25分13秒";
        timeLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:timeLabel];
    }
    return self;
}

- (void)fillWithTitle:(NSString *)title
{
    titleLabel.text = title;
    
}
@end
