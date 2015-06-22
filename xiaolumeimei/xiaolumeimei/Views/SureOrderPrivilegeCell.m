//
//  SureOrderPrivilegeCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/13.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "SureOrderPrivilegeCell.h"

static BOOL _isSelected;
@implementation SureOrderPrivilegeCell
{
    NSMutableArray *_dataArr;
}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)getData
{
    _dataArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<2; i++) {
        [_dataArr addObject:[NSString stringWithFormat:@"%d",i+1]];
    }
    
}

- (IBAction)showPrivilegesAction:(id)sender
{
    _isSelected = !_isSelected;
    //NSLog(@"_isSelected-->%d",_isSelected);
    _getController(_isSelected);
    //NSLog(@"可用优惠券按钮被点击~~");
}

@end
