//
//  CHAllItem.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHAllItem.h"
#import "CHTopCommentItem.h"
#import <MJExtension/MJExtension.h>

@implementation CHAllItem

#pragma mark - 该方法是用来告诉MJExtension框架,这个属性的数组的用来保存CHTopCommentItem这个模型的
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"top_cmt" : @"CHTopCommentItem"};
}
#pragma mark - 重写set方法,在已经转好的模型数组,取出对应的模型给属性赋值
- (void)setTop_cmt:(NSArray *)top_cmt{
    _top_cmt = top_cmt;
    //到这一步的时候,这个数组的元素已经全部转成模型的了,这就是这个框架的厉害之处
    if (_top_cmt) {
        self.topCommentItem = top_cmt.firstObject;
        
    }
}

@end
