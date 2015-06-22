//
//  HttpRequestManager.m
//  Younishijie
//
//  Created by younishijie on 15/3/16.
//  Copyright (c) 2015年 younishijie. All rights reserved.
//

#import "HttpRequestManager.h"


@implementation HttpRequestManager
{
    AFHTTPRequestOperationManager *manager;
}

+ (id)shareInstance
{
    static HttpRequestManager *m = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        m = [[HttpRequestManager alloc] init];
    });
    return m;
}

- (void)addPOSTRequestParameters:(NSDictionary *)parameters
                         success:(void(^)(id successobject))success
                            fail:(void(^)(id failobject))fail
{
    if (manager == nil) {
        manager = [AFHTTPRequestOperationManager manager];
    }
    manager.requestSerializer.timeoutInterval = 10;
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
     //[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];

    
    [manager POST:BaseHostAddress parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //NSLog(@"operation:%@",operation.responseString);
        NSLog(@"error:%@",error);
        if (fail) {
            fail(error);
        }
    }];
}


@end
