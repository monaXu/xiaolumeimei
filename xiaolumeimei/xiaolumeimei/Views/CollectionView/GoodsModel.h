//
//  GoodsModel.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/5.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "BaseModel.h"

@interface GoodsModel : BaseModel

@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *fullPrice;
@property (nonatomic,assign) BOOL hasMore;
@property (nonatomic,assign) BOOL isSoldOut;

@end
