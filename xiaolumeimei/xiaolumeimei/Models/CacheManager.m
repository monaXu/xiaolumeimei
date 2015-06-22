//
//  CacheManager.m
//  爱限免
//
//  Created by huangdl on 14-10-8.
//  Copyright (c) 2014年 1000phone. All rights reserved.
//

#import "CacheManager.h"
#import "NSString+MD5Addition.h"

@interface CacheManager ()

+(id)sharedManager;

@end

@implementation CacheManager
{
    NSString *_cachePath;
    NSFileManager *_fm;
}

+(id)sharedManager
{
    static CacheManager *_m = nil;
    if (!_m) {
        _m = [[CacheManager alloc]init];
    }
    return _m;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //当前保存缓存的目录
        _cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/younishijie/cache"];
        _fm = [NSFileManager defaultManager];
        //判断缓存路径是否存在,不存在就创建
        if (![_fm fileExistsAtPath:_cachePath]) {
            [_fm createDirectoryAtPath:_cachePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
    }
    return self;
}

//将当前的url,变成md5
-(NSString *)filePath:(NSString *)str
{
    return [_cachePath stringByAppendingPathComponent:[str stringFromMD5]];
}

-(BOOL)isExist:(NSString *)name
{
    return [_fm fileExistsAtPath:[self filePath:name]];
}

-(NSData *)getCache:(NSString *)name
{
    return [NSData dataWithContentsOfFile:[self filePath:name]];
}

-(void)saveCache:(NSData *)data forName:(NSString *)cacheName
{
    [data writeToFile:[self filePath:cacheName] atomically:NO];
}


//判断缓存是否存在
+(BOOL)isExist:(NSString *)cacheName
{
    return [[CacheManager sharedManager]isExist:cacheName];
}

//获取缓存
+(NSData *)getCache:(NSString *)cacheName
{
    return [[CacheManager sharedManager]getCache:cacheName];
}

//将缓存添加到列表页缓存
+(void)addCache:(NSData *)data forCacheName:(NSString *)cacheName currentPage:(NSInteger)page
{
    [[CacheManager sharedManager]addCache:data forCacheName:cacheName currentPage:page];
}

//保存缓存
+(void)saveCache:(NSData *)data forName:(NSString *)cacheName
{
    [[CacheManager sharedManager] saveCache:data forName:cacheName];
}


@end
