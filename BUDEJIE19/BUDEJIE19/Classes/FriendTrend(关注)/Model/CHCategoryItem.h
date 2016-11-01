//
//  CHCategoryItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/31.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCategoryItem : NSObject
/**类别名*/
@property (nonatomic, strong)NSString *name;
/**请求用户信息时,服务器指定要传递的数据*/
@property(nonatomic, strong)NSString *id;
/**每个类别中 用户信息的集合*/
@property (nonatomic, strong)NSMutableArray *users;
/**用户总页数(一共有多少页数据)*/
@property(nonatomic, assign)NSInteger total_page;
/**用户数据已经加载了的页数*/
@property(nonatomic, assign)NSInteger pageNumber;
@end
