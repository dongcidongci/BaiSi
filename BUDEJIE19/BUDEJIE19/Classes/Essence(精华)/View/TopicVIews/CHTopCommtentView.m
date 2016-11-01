//
//  CHTopCommtentView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/26.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTopCommtentView.h"
#import "CHAllItem.h"
#import "CHTopCommentItem.h"
#import "CHUserMessageitem.h"
@interface CHTopCommtentView ()
/**占位view(有语音和用户名)*/
@property (weak, nonatomic) IBOutlet UIView *contentView;
/**用户名*/
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
/**播放声音的按钮*/
@property (weak, nonatomic) IBOutlet UIButton *voiceLengthBtn;
/**评论的正文*/
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end
@implementation CHTopCommtentView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (void)setAllItem:(CHAllItem *)allItem{
    
    [super setAllItem:allItem];
    if (allItem.topCommentItem.cmt_type == kCHCommentTypeText) {
        self.contentView.hidden = YES;
        self.textLabel.hidden = NO;
        self.textLabel.text = allItem.topCommentItem.name_content;
    }else{
        self.contentView.hidden = NO;
        self.textLabel.hidden = YES;
        self.usernameLabel.text = [NSString stringWithFormat:@"%@:", allItem.topCommentItem.user.username];
       NSString *voiceTime = [NSString stringWithFormat:@"%@″",allItem.topCommentItem.voicetime];
        [self.voiceLengthBtn setTitle:voiceTime forState:UIControlStateNormal];
    }
    
    
}
#pragma mark - 监听播放音频评论的按钮点击事件
- (IBAction)playVoiceBtnClick:(UIButton *)sender {
}

@end
