//
//  CHCollectionCellItem.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHCollectionCellItem.h"

@implementation CHCollectionCellItem
+ (instancetype)collectionCellItemDict:(NSDictionary *)dict{
    
    CHCollectionCellItem *item = [[CHCollectionCellItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
