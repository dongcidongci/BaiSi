//
//  CHCollectionView.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHCollectionCellItem;

@interface CHCollectionView : UIView

/**cell模型*/
@property (nonatomic, strong)CHCollectionCellItem *cellItem;
/**快速创建collectionView对象*/
+ (instancetype)collectionView;
@end
