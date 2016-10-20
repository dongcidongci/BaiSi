//
//  CHCollectionVCell.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHCollectionVCell.h"
#import "CHCollectionCellItem.h"

#import <UIImageView+WebCache.h>

@interface CHCollectionVCell ()
/**按钮 */
@property(weak, nonatomic) UIButton *button;
@end
@implementation CHCollectionVCell

- (UIButton *)button{
    if (_button == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.imageEdgeInsets = UIEdgeInsetsMake(-15, 20, 20, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(60, -60, 0, 0);
        button.frame = self.bounds;
        [self addSubview:button];
        _button = button;
    }
    return _button;
}
+ (instancetype)collectionVCellWithCollectionV:(UICollectionView *)view ID:(NSString *)ID forIndexPath:(NSIndexPath *)indexPath{
    CHCollectionVCell *cell = [view dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)setCellItem:(CHCollectionCellItem *)cellItem{
    _cellItem = cellItem;
    self.button.titleLabel.text = self.cellItem.name;
    
   [self.button.imageView sd_setImageWithURL:[NSURL URLWithString:cellItem.icon]];
}





@end
