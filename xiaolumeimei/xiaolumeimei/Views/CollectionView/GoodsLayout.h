//
//  GoodsLayout.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/5.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"

@interface GoodsLayout : UICollectionViewFlowLayout<UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,assign) BOOL isToday;

@end
