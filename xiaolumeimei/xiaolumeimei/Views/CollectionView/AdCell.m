//
//  AdCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/6.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "AdCell.h"

@interface AdCell ()

@end

@implementation AdCell
{
    
    __weak IBOutlet UILabel *retainDayLabel;
    __weak IBOutlet UIImageView *addImgV;
}

- (void)fillAddData:(AdModel *)model
{
    [addImgV setImage:[UIImage imageNamed:model.imageUrl]];
    retainDayLabel.text = model.remainDay;
}
- (void)awakeFromNib {
    // Initialization code
}

@end
