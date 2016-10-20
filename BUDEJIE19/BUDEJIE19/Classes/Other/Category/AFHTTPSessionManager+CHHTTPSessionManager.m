//
//  AFHTTPSessionManager+CHHTTPSessionManager.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/18.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "AFHTTPSessionManager+CHHTTPSessionManager.h"

@implementation AFHTTPSessionManager (CHHTTPSessionManager)
+ (instancetype)CHManager{
    //创建网络会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置它的默认解析器为JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //为它的响应头能解析的数据类型做扩展(这句代码是关键)
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    return manager;
}
@end
