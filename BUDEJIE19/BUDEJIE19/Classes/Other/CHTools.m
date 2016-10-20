//
//  CHTools.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTools.h"
#import <AFNetworking.h>
#import "AFHTTPSessionManager+CHHTTPSessionManager.h"

@implementation CHTools

- (void)GETRequestPath:(NSString *)path parameters :(nullable id)parameters {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager CHManager];
    [manager GET:path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
@end
