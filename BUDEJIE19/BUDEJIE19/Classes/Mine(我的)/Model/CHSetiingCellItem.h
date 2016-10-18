//
//  CHSetiingCellItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHSetiingCellGroupItem : NSObject
/**组模型*/
@property (nonatomic, strong)NSArray *groupItem;
/**是否有尾部View*/
@property(nonatomic, assign, getter=isFooter)BOOL footer;
/**创建组模型对象*/
+ (instancetype)setiingCellGroupItem;

@end



@interface CHSetiingCellItem : NSObject
/**头像*/
@property (nonatomic, strong)NSString *icon;
/**标题*/
@property (nonatomic, strong)NSString *title;
/**跳转的控制器*/
@property (nonatomic, strong)Class controllerName;
/**创建模型对象*/
+(instancetype) setiingCellItemWithTitle:(NSString *)title icon:(NSString *)icon controllerName:(Class)controllerName;
@end








