//
//  CHTopicBasicView.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHAllItem;
@interface CHTopicBasicView : UIView
/**每一个cell对应的模型数据*/
@property (nonatomic, strong)CHAllItem *allItem;
/**加载xib*/
+ (instancetype)loadXib;

@end
