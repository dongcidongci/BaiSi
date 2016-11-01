//
//  CHVoiceTopicView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHVoiceTopicView.h"
#import <UIImageView+WebCache.h>
#import "CHAllItem.h"
@interface CHVoiceTopicView ()

@property (weak, nonatomic) IBOutlet UILabel *playCountLable;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end
@implementation CHVoiceTopicView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (void)setAllItem:(CHAllItem *)allItem{
    [super setAllItem:allItem];
    
    //框架中这个方法是没有回到主线程的,所以我们自己要回到主线程刷新界面
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:allItem.image0] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:nil];
    self.playCountLable.text = [NSString stringWithFormat:@"%ld次播放", allItem.voicelength];
   CGFloat minute = allItem.voicetime / 60;
    CGFloat second = allItem.voicetime % 60;
    self.timerLabel.text = [NSString stringWithFormat:@"%0.0lf:%0.0lf", minute,second];
    
}











#pragma mark - 监听播放按钮的点击事件
- (IBAction)playButtonClick:(UIButton *)sender {
}

@end
