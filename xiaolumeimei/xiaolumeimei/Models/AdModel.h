//
//  AdModel.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/6.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "BaseModel.h"

@interface AdModel : BaseModel

@property (nonatomic,copy) NSString *imageUrl;
@property (nonatomic,copy) NSString *remainDay;
@property (nonatomic,assign) BOOL hasMore;

@end
