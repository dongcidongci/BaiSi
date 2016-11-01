//
//  CHTopicBasicView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTopicBasicView.h"

@implementation CHTopicBasicView


+ (instancetype)loadXib{
    //NSLog(@"loadxib%@",self);
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (void)setAllItem:(CHAllItem *)allItem{
    _allItem = allItem;
    
}
@end
