//
//  CHPullDownRefreshView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/29.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHPullDownRefreshView.h"

@interface CHPullDownRefreshView ()
/**提示用户可以下拉刷新*/
@property (weak, nonatomic) IBOutlet UIView *hintView;
/**正在加载数据的提示*/
@property (weak, nonatomic) IBOutlet UIView *loadingView;
/**指示图标*/
@property (weak, nonatomic) IBOutlet UIImageView *hintImageView;
/**指示的文字*/
@property (weak, nonatomic) IBOutlet UILabel *hintTextLabel;

@end
@implementation CHPullDownRefreshView
- (void)awakeFromNib{
    [super awakeFromNib];
    self.hintTextLabel.alpha = 0;
    self.hintImageView.alpha = 0;
    self.autoresizingMask = UIViewAutoresizingNone;
}
+ (instancetype)loadXib{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)setRefreshing:(BOOL)refreshing{
    _refreshing = refreshing;
    self.hintView.hidden = refreshing;
    self.loadingView.hidden = !refreshing;
   
    
    
}

- (void)setNeedRefresh:(BOOL)needRefresh{
    _needRefresh = needRefresh;
    if (needRefresh) {
        self.hintTextLabel.text = @"松开加载更多数据";
        [UIView animateWithDuration:0.25 animations:^{
            
            self.hintImageView.transform = CGAffineTransformMakeRotation(-M_PI + 0.00001);
        }];
    }else{
        self.hintTextLabel.text = @"下拉加载更多数据";
        [UIView animateWithDuration:0.25 animations:^{
            self.hintImageView.transform = CGAffineTransformIdentity;
        }];
    }
    
    
}
- (void)setTextAlpha:(CGFloat)textAlpha{
    _textAlpha = textAlpha;
    self.hintTextLabel.alpha = textAlpha;
    self.hintImageView.alpha = textAlpha;
   // NSLog(@"%s", __func__);
}
@end
