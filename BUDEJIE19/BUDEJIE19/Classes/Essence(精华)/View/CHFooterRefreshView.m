//
//  CHFooterRefreshView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/29.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHFooterRefreshView.h"

@interface CHFooterRefreshView ()
/**正在加载数据的提示板*/
@property (weak, nonatomic) IBOutlet UIView *loadingIndicatorView;
/**提示用户可以上拉刷新数据的板*/
@property (weak, nonatomic) IBOutlet UILabel *indicatorView;

@end
@implementation CHFooterRefreshView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}
+ (instancetype)loadXib{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)setRefreshing:(BOOL)refreshing{
    _refreshing = refreshing;
    self.loadingIndicatorView.hidden = !refreshing;
    self.indicatorView.hidden = refreshing;
    
}






@end
