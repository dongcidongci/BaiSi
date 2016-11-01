//
//  CHBottomView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/26.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHBottomView.h"
#import "CHAllItem.h"

@interface CHBottomView ()
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end
@implementation CHBottomView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = NO;
}
- (void)setAllItem:(CHAllItem *)allItem{
    [super setAllItem:allItem];
    allItem.ding = 0;
    [self setTitleWithNum:allItem.ding button:self.dingBtn];
    [self setTitleWithNum:allItem.cai button:self.caiBtn];
    [self setTitleWithNum:allItem.repost button:self.shareBtn];
    [self setTitleWithNum:allItem.comment button:self.commentBtn];
    
}
- (void)setTitleWithNum:(CGFloat)num button:(UIButton *)button{
    
    NSString *string = button.currentTitle;
    
    if (num >= 10000) {
        num = num / 10000;
        string = [NSString stringWithFormat:@"%0.1lf万", num];
        
    }else if(num > 0){
       string = [NSString stringWithFormat:@"%.0lf", num];
    }
    [string stringByReplacingOccurrencesOfString:@".0" withString:@""];
    [button setTitle:string forState:UIControlStateNormal];
}

#pragma mark - 分享
- (IBAction)shareBtnClick:(UIButton *)sender {
    
}
#pragma mark - 踩
- (IBAction)caiBtnClick:(UIButton *)sender {
}
#pragma mark - 评论
- (IBAction)commentBtnClick:(UIButton *)sender {
}

#pragma mark - 顶
- (IBAction)dingBtnClick:(UIButton *)sender {
}


@end
