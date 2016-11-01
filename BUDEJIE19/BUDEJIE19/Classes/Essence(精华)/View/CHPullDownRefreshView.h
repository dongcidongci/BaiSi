//
//  CHPullDownRefreshView.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/29.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHPullDownRefreshView : UIView
/**是否正在刷新数据*/
@property(nonatomic, assign, getter=isRefreshing)BOOL refreshing;
@property(nonatomic, assign)BOOL needRefresh;
/**文字的透明度*/
@property(nonatomic, assign)CGFloat textAlpha;
/**加载xib*/
+ (instancetype)loadXib;
@end
