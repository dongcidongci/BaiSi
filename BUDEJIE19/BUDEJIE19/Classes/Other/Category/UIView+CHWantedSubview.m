//
//  UIView+CHWantedSubview.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/30.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "UIView+CHWantedSubview.h"

@implementation UIView (CHWantedSubview)
//递归(self,谁调用就是谁)
- (UITableView *)wantedSubview{
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:[UITableView class]]) {
            return (UITableView *)view;
        }
        UITableView *tableV = [view wantedSubview];
        return tableV;
        
    }
    return nil;
}

@end
