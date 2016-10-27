//
//  CHCollectionVCell.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHCollectionVCell.h"
#import "CHCollectionCellItem.h"
#import "CHButton.h"

#import "UIButton+WebCache.h"
//#import "SDWebImageDownloader.h"

@interface CHCollectionVCell ()
/**按钮 */
@property(weak, nonatomic) CHButton *button;
@end
@implementation CHCollectionVCell

- (UIButton *)button{
    if (_button == nil) {
        CHButton *button = [CHButton buttonWithType:UIButtonTypeCustom];
        button.enabled = NO;
        button.adjustsImageWhenDisabled = NO;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         button.frame = self.bounds;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:button];
        _button = button;
    }
    return _button;
}

+ (instancetype)collectionVCellWithCollectionV:(UICollectionView *)view ID:(NSString *)ID forIndexPath:(NSIndexPath *)indexPath{
    CHCollectionVCell *cell = [view dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    return cell;
}

- (void)setCellItem:(CHCollectionCellItem *)cellItem{
    _cellItem = cellItem;
    //Button的内容,一定记住要用set方法来设置,不能用.语法
    [self.button setTitle:cellItem.name forState:UIControlStateNormal];
    [self.button sd_setImageWithURL:[NSURL URLWithString:cellItem.icon] forState:UIControlStateNormal];
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:cellItem.icon] options:0 progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        
//        //需要做线程间通信！！！
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            //data 图片的二进制数据
//            [self.button setImage:image forState:UIControlStateNormal];
//        }];
//        
//    }];

}





@end
