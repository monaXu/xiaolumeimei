//
//  SureOrderAddressCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/13.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "SureOrderAddressCell.h"

@implementation SureOrderAddressCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}
- (IBAction)modifyAddressAction:(id)sender
{
    _getAddressVC();
}

@end
