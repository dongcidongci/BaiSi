//
//  AFHTTPSessionManager+CHHTTPSessionManager.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/18.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (CHHTTPSessionManager)
/**网络会话管理者的扩展(text/html)*/
+ (instancetype)CHManager;
@end
