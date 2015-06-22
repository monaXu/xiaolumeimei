//
//  CacheManager.h
//  爱限免
//
//  Created by huangdl on 14-10-8.
//  Copyright (c) 2014年 1000phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject


//判断缓存是否存在
+(BOOL)isExist:(NSString *)cacheName;

//获取缓存
+(NSData *)getCache:(NSString *)cacheName;

//将缓存添加到列表页缓存
+(void)addCache:(NSData *)data forCacheName:(NSString *)cacheName currentPage:(NSInteger)page;

//保存缓存
+(void)saveCache:(NSData *)data forName:(NSString *)cacheName;

@end









