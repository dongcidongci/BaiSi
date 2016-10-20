//
//  CHNavigationBar.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/20.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHNavigationBar.h"
#import "CHBackView.h"

@implementation CHNavigationBar

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[CHBackView class]]) {
            view.x = 0;
        }
    }
}



@end
