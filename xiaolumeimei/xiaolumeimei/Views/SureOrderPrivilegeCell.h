//
//  SureOrderPrivilegeCell.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/13.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SureOrderPrivilegeCell : UITableViewCell

@property (nonatomic,copy) void (^getController)(BOOL);
//@property (nonatomic,assign) BOOL isSelected;
@end
