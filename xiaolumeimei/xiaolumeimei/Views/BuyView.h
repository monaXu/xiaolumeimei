//
//  BuyView.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/22.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyView : UIView

@property (nonatomic,copy) void (^buyGoodsBlock)();


+ (void)buyViewShow;

+ (void)buyViewHidden;

@end
