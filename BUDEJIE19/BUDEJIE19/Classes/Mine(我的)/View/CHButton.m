//
//  CHButton.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/22.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHButton.h"

@implementation CHButton

- (void)layoutSubviews{
    [super layoutSubviews];
    //左右间距
    CGFloat marginR = 20;
    //顶部间距
    CGFloat marginTop = 10;
    //标题label的高度
    CGFloat titleH = 25;
    //图片控件的高度
    CGFloat imageH = self.height - titleH - marginR;
    self.imageView.frame = CGRectMake(marginR, marginTop, self.width - 2 * marginR, imageH);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + 5, self.width, titleH);
}

@end
