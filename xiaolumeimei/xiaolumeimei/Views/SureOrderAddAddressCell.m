//
//  SureOrderAddAddressCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/13.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "SureOrderAddAddressCell.h"

@implementation SureOrderAddAddressCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addAddressAction:(id)sender
{
    _goToAddressVC();
}
@end
