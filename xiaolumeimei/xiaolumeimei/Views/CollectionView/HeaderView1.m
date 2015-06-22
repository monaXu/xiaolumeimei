//
//  HeaderView1.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/12.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "HeaderView1.h"

@implementation HeaderView1
{
    UILabel *timeLabel;
    UILabel *subLabel;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.frame = CGRectMake(0, 0, WIDTH, 30);
//        self.backgroundColor = [UIColor blueColor];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 150, 30)];
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 15;
        imageView.backgroundColor = [UIColor blueColor];
        [self addSubview:imageView];
        
        
        CGFloat timeWidth = 80;
        CGFloat timeHeight = 20;
        
        timeLabel =[[UILabel alloc] initWithFrame:CGRectMake(5,10, timeWidth, timeHeight)];
        timeLabel.textColor = [UIColor whiteColor];
        timeLabel.text = @"每天10:00";
        [imageView addSubview:timeLabel];
        
        subLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 15, 80, 10)];
        subLabel.textColor = [UIColor whiteColor];
        subLabel.font = [UIFont systemFontOfSize:13];
        subLabel.text = @"新品上线";
        [imageView addSubview:subLabel];
    }
    return self;
}
@end
