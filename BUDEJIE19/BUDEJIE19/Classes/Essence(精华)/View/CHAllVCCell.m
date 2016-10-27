//
//  CHAllVCCell.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHAllVCCell.h"
#import "CHAllTopicTopView.h"
#import "CHPhotoTopicView.h"
#import "CHEssenceViewItem.h"
#import "CHAllItem.h"
#import "CHVoiceTopicView.h"
#import "CHVideoTopicView.h"
#import "CHTopCommtentView.h"
#import "CHBottomView.h"


@interface CHAllVCCell ()
/**cell顶部板块的控件 */
@property(weak, nonatomic)  CHAllTopicTopView *topView;
/**cell中间图片板块的控件 */
@property(weak, nonatomic)  CHPhotoTopicView *photoView;
/**cell中间音频板块的控件 */
@property(weak, nonatomic)  CHVoiceTopicView *voiceView;
/**cell中间视频板块的控件 */
@property(weak, nonatomic) CHVideoTopicView *videoView;
/**cell最热评论板块 */
@property(weak, nonatomic)  CHTopCommtentView *top_comView;
/**底部评论的板块 */
@property(weak, nonatomic) CHBottomView *bottomView;
@end
@implementation CHAllVCCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubviews];
        
    }
    return self;
}
- (void)setUpSubviews{
    //顶部的部分(头像/名称/创建时间/文本内容)
    CHAllTopicTopView *topView = [CHAllTopicTopView loadXib];
    [self.contentView addSubview:topView];
    self.topView = topView;
    //中间内容模块
    CHPhotoTopicView *photoView = [CHPhotoTopicView loadXib];
    [self.contentView addSubview:photoView];
    self.photoView = photoView;
    
    CHVoiceTopicView *voiceView = [CHVoiceTopicView loadXib];
    [self.contentView addSubview:voiceView];
    self.voiceView = voiceView;
    
    CHVideoTopicView *videoView = [CHVideoTopicView loadXib];
    [self.contentView addSubview:videoView];
    self.videoView = videoView;
    CHTopCommtentView *top_comView = [CHTopCommtentView loadXib];
    [self.contentView addSubview:top_comView];
    self.top_comView = top_comView;
    
    CHBottomView *bottomView = [CHBottomView loadXib];
    [self.contentView addSubview:bottomView];
    self.bottomView = bottomView;
}

- (void)setEssenceViewItem:(CHEssenceViewItem *)essenceViewItem{
    _essenceViewItem = essenceViewItem;
    //把模型传给具体的xib,负责展示出来
    self.topView.allItem = essenceViewItem.allItem;
    self.topView.frame = essenceViewItem.topViewFrame;
    
    self.photoView.allItem = essenceViewItem.allItem;
    self.photoView.frame = essenceViewItem.middleViewFrame;
    
    self.videoView.allItem = essenceViewItem.allItem;
    self.videoView.frame = essenceViewItem.middleViewFrame;
    
    self.voiceView.allItem = essenceViewItem.allItem;
    self.voiceView.frame = essenceViewItem.middleViewFrame;
    
    self.top_comView.allItem = essenceViewItem.allItem;
    self.top_comView.frame = essenceViewItem.topCmt_ViewFrame;
    self.bottomView.allItem = essenceViewItem.allItem;
    self.bottomView.frame = essenceViewItem.bottomViewFrame;
    
    if (essenceViewItem.allItem.type == kCHTopicTypePhoto) {
        self.photoView.hidden = NO;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    }else if (essenceViewItem.allItem.type == kCHTopicTypeVoice){
        self.photoView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = NO;
    }else if (essenceViewItem.allItem.type == kCHTopicTypeVideo){
        self.photoView.hidden = YES;
        self.videoView.hidden = NO;
        self.voiceView.hidden = YES;
    }else if (essenceViewItem.allItem.type == kCHTopicTypeText){
        self.photoView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    }
    if (essenceViewItem.allItem.topCommentItem) {
        self.top_comView.hidden = NO;
    }else{
        self.top_comView.hidden = YES;
    }
    //NSLog(@"%@", NSStringFromCGRect(self.photoView.frame));
}

- (void)setFrame:(CGRect)frame{
    frame.size.height -= 10;
    frame.origin.y -= 10;
    [super setFrame:frame];
}
@end
