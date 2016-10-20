//
//  CHCollectionView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHCollectionView.h"
#import "CHCollectionVCell.h"
#import "CHCollectionCellItem.h"

@interface CHCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

/**collectionView */
@property(weak, nonatomic) UICollectionView *collectionView;

@end
//collectionViewCell的重用标识
 static NSString *ID = @"footer";
@implementation CHCollectionView

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
        flowL.itemSize = CGSizeMake(80, 80);
     UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowL];
        //collectionV.frame = self.bounds;
        collectionV.frame = CGRectMake(0, 0, self.width, self.height);
        //collectionV.backgroundColor = [UIColor redColor];
        collectionV.delegate = self;
        collectionV.dataSource = self;
        _collectionView = collectionV;
        [collectionV registerClass:[CHCollectionVCell class] forCellWithReuseIdentifier:ID];
        [self addSubview:collectionV];
    }
    return _collectionView;
}

+ (instancetype)collectionView{
    CHCollectionView *view = [[CHCollectionView alloc] init];
    return view;
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CHCollectionVCell *cell = [CHCollectionVCell collectionVCellWithCollectionV:collectionView ID:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.cellItem = self.cellItem;
    NSLog(@"cellForItemAtIndexPath");
    return cell;
}

- (void)setCellItem:(CHCollectionCellItem *)cellItem{
    _cellItem = cellItem;
    [self collectionView];
}






@end
