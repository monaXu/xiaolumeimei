//
//  CartCarTableViewCell.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/12.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCarTableViewCell : UITableViewCell

@property (nonatomic,copy) void (^cartDeleteBlock)();

@end
