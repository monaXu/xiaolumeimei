//
//  TitleCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/11.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell
{
    UILabel *_titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //NSLog(@"%f %f %f %f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH,30)];
        //_titleLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)fillTitle:(NSString *)title
{
    _titleLabel.text = title;
}

@end
