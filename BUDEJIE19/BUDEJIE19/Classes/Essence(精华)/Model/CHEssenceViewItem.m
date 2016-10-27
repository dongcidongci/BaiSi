//
//  CHEssenceViewItem.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHEssenceViewItem.h"
#import "CHAllItem.h"
#import "CHTopCommentItem.h"
#import "CHUserMessageItem.h"
@implementation CHEssenceViewItem

- (void)setAllItem:(CHAllItem *)allItem{
    _allItem = allItem;
/**根据text计算顶部view的frame(view内部除了text不固定其他的东西都是固定的)**/
    //定义基本变量
    CGFloat margin = 10;
    CGFloat viewX = margin;
    CGFloat viewY = margin;
    CGFloat viewW = CHSCREENW - 2 * margin;
    //字体的大小要根据自己设置的字体大小来计算
    CGFloat textLabelH = [allItem.text sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(viewW, MAXFLOAT)].height;
    //数据55是在xib中可以直接查看得到,也可以通过计算
    CGFloat viewH = margin + 55 + textLabelH;
    CGRect frame = CGRectMake(viewX, viewY, viewW, viewH);
    self.topViewFrame = frame;
    self.cellHeight = viewH + margin;
/**根据图片的数据计算图片在屏幕显示的高度,以及cell该显示的高度**/
    if (!(allItem.type == kCHTopicTypeText)) {
        CGFloat photoH = viewW / allItem.width * allItem.height;
        if (photoH > 600) {
            //如果图片大于屏幕宽度,就让他只显示300的高度,再让用户点击查看大图
            photoH = 300;
            self.allItem.bigPhoto = YES;
        }
        CGRect middleFrame = CGRectMake(margin, viewH + 2 * margin, viewW, photoH);
        self.middleViewFrame = middleFrame;
        self.cellHeight = CGRectGetMaxY(self.middleViewFrame) + margin;
    }
    /**根据最热评论的数据计算最热评论板块的Frame以及cell的最新高度**/
    if (allItem.topCommentItem) {
        CGFloat topCommentVX = margin;
        CGFloat topCommentVY = CGRectGetMaxY(self.middleViewFrame) + margin;
        CGFloat topCommentVW = viewW;
        //设置最热评论的默认高度为40,可以在xib中查看得到默认高度
        CGFloat topCommentVH = 40;
        
        if (allItem.topCommentItem.cmt_type == kCHCommentTypeText) {
            //纯文本的评论
            NSString *name_content = [NSString stringWithFormat:@"%@:%@", allItem.topCommentItem.user.username, allItem.topCommentItem.content];
            allItem.topCommentItem.name_content = name_content;
            CGFloat textLabelH = [name_content sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(viewW, MAXFLOAT)].height;
            //17是最热评论label的高度, 5是两个控件的间隙
            topCommentVH = textLabelH + 17 + 5;
        
            
        }
            //语音评论(如果是语音的评论,高度是固定的了,可以在xib中查看得到高度)
        self.topCmt_ViewFrame = CGRectMake(topCommentVX, topCommentVY, topCommentVW, topCommentVH);
        self.cellHeight = CGRectGetMaxY(self.topCmt_ViewFrame) + margin;
        
    }
    /**根据底部View的数据计算板块的Frame以及cell的最新高度**/
    CGFloat bottomVX = margin;
    CGFloat bottomVY = viewH + self.middleViewFrame.size.height + self.topCmt_ViewFrame.size.height + 4 * margin;
    CGFloat bottomVW = viewW;
    CGFloat bottomVH = 30;
   
    self.bottomViewFrame = CGRectMake(bottomVX, bottomVY, bottomVW, bottomVH);
    self.cellHeight = CGRectGetMaxY(self.bottomViewFrame) + margin;
}

@end
