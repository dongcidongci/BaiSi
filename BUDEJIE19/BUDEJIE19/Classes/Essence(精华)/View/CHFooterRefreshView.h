//
//  CHFooterRefreshView.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/29.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHFooterRefreshView : UIView
/**加载xib*/
+ (instancetype)loadXib;
/**是否正在刷新数据*/
@property(nonatomic, assign, getter=isRefreshing)BOOL refreshing;
@end
