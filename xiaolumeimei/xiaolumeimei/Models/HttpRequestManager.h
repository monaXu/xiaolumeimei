//
//  HttpRequestManager.h
//  Younishijie
//
//  Created by younishijie on 15/3/16.
//  Copyright (c) 2015年 younishijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define BaseHostAddress @"http://sale.huyi.so/app/ios/connection/"


@interface HttpRequestManager : NSObject

+ (id)shareInstance;

- (void)addPOSTRequestParameters:(NSDictionary *)parameters
                         success:(void(^)(id successobject))success
                            fail:(void(^)(id failobject))fail;

@end
