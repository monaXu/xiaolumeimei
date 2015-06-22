//
//  CartTableViewCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/9.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "CartTableViewCell.h"

@implementation CartTableViewCell
{
    UIImageView *_imgV;
    UILabel *_titleLabel;
    UILabel *_sizeLabel;
    UITextField *_countTf;
    UILabel *_priceLabel;
    UILabel *_factPriceLabel;
    UIButton *_deleteBtn;
}
- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat height = self.bounds.size.height;
        CGFloat margin = 5;
        CGFloat imgWidth = WIDTH/3;
        CGFloat imgHeight = height - 2 * margin;
        CGFloat titleWidth = WIDTH/2;
        CGFloat titleHeight = height/3;
        CGFloat sizeWidth;
        CGFloat sizeHeight;
        
        _imgV = [[UIImageView alloc] init];
        [self addSubview:_imgV];
        
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        
        _sizeLabel = [[UILabel alloc] init];
        [self addSubview:_sizeLabel];
        
        _countTf = [[UITextField alloc] init];
        [self addSubview:_countTf];
        
        _priceLabel = [[UILabel alloc] init];
        [self addSubview:_priceLabel];
        
        _factPriceLabel = [[UILabel alloc] init];
        [self addSubview:_factPriceLabel];
        
        _deleteBtn = [[UIButton alloc] init];
        [self addSubview:_deleteBtn];
        
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
