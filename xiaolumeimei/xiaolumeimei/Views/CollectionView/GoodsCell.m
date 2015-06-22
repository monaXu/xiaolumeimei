//
//  GoodsCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/5.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "GoodsCell.h"
#import "UIImageView+WebCache.h"

@interface GoodsCell ()

@end

@implementation GoodsCell
{
    
    __weak IBOutlet UILabel *lastPriceLabel;
    __weak IBOutlet UILabel *priceLabel;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UIImageView *imgV;
    __weak IBOutlet UIView *soldOutView;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    CGFloat radius = soldOutView.frame.size.width/2;
    soldOutView.clipsToBounds = YES;
    soldOutView.layer.cornerRadius = radius;
    soldOutView.alpha = 0.5;

}
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat radius = soldOutView.frame.size.width/2;
        soldOutView.clipsToBounds = YES;
        soldOutView.layer.cornerRadius = radius;
        soldOutView.alpha = 0.5;
    }
    return self;
}
- (void)fillData:(GoodsModel *)model
{
    [imgV setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:[UIImage imageNamed:@"img_place"]];
    titleLabel.text = model.title;
    priceLabel.text = model.price;
    lastPriceLabel.text = model.fullPrice;
    soldOutView.hidden = model.isSoldOut;
}

@end
