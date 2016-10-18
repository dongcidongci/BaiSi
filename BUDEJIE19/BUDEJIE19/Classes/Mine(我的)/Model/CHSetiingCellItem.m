//
//  CHSetiingCellItem.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSetiingCellItem.h"


@implementation CHSetiingCellGroupItem
+ (instancetype)setiingCellGroupItem{
    CHSetiingCellGroupItem *groupItem = [[CHSetiingCellGroupItem alloc] init];
    
    return groupItem;
    
}

@end


@implementation CHSetiingCellItem
+(instancetype)setiingCellItemWithTitle:(NSString *)title icon:(NSString *)icon controllerName:(Class)controllerName{
    CHSetiingCellItem *item = [[CHSetiingCellItem alloc] init];
    item.title = title;
    item.icon = icon;
    item.controllerName = controllerName;
    return item;
}
@end
