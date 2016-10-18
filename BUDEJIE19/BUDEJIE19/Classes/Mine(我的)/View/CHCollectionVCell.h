//
//  CHCollectionVCell.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHCollectionCellItem;

@interface CHCollectionVCell : UICollectionViewCell
/**cell模型*/
@property (nonatomic, strong)CHCollectionCellItem *cellItem;
/**快速创建cell*/
+ (instancetype)collectionVCellWithCollectionV:(UICollectionView *)view ID:(NSString *)ID forIndexPath:(NSIndexPath *)indexPath;
@end
