//
//  CHEssenceViewItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CHAllItem;

@interface CHEssenceViewItem : NSObject
/**mainVC的每一行cell所要展示的数据模型*/
@property (nonatomic, strong)CHAllItem *allItem;
/**cell中顶部模块的Frame*/
@property(nonatomic, assign)CGRect topViewFrame;
/**cell中部模块的Frame(图片/视频/声音)*/
@property(nonatomic, assign)CGRect middleViewFrame;
/**cell中最热评论模块的Frame(文字/声音)*/
@property(nonatomic, assign)CGRect topCmt_ViewFrame;
/**cell中底部评论/分享/踩/顶的Frame*/
@property(nonatomic, assign)CGRect bottomViewFrame;
/**cell的高度*/
@property(nonatomic, assign)CGFloat cellHeight;

@end
