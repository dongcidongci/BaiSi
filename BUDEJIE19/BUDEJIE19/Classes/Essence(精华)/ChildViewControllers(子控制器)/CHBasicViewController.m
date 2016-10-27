//
//  CHBasicViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/23.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHBasicViewController.h"



@interface CHBasicViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
/**顶部的View */
@property(weak, nonatomic) UIScrollView *topScrollV;
/**中间内容View */
@property(weak, nonatomic) UICollectionView *collectionView;
/**选中的button */
@property(weak, nonatomic) UIButton *selectedBtn;
/**标题按钮的集合*/
@property (nonatomic, strong)NSMutableArray *btnArray;
/**下划线提示器 */
@property(weak, nonatomic) UIView *underLine;
@property(nonatomic, assign)BOOL hasChildVC;

@end

static NSString * const ID = @"essenceCell";
@implementation CHBasicViewController

- (NSMutableArray *)btnArray
{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
        
    }
    return _btnArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加顶部的view
    [self addTopView];
    //添加中间内容view
    [self addMidView];
    //添加标题的按钮
    //[self addTitleButton];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - 顶部的视图
- (void)addTopView{
    CGFloat y = self.navigationController.navigationBar.hidden==YES?20:64;
    UIScrollView *topView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, y, CHSCREENW, 35)];
    //NSLog(@"y%lf", y);
    topView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    [self.view addSubview:topView];
    self.topScrollV = topView;
    
}

#pragma mark - 中间的内容View
- (void)addMidView{
    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
    flowL.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    flowL.minimumLineSpacing = 0;
    flowL.minimumInteritemSpacing = 0;
    flowL.itemSize = [UIScreen mainScreen].bounds.size;
    
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowL];
    collectionV.dataSource = self;
    collectionV.delegate = self;
    collectionV.backgroundColor = [UIColor blueColor];
    [self.view insertSubview:collectionV atIndex:0];
    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    collectionV.showsVerticalScrollIndicator = NO;
    collectionV.showsHorizontalScrollIndicator = NO;
    collectionV.pagingEnabled = YES;
    collectionV.bounces = NO;
    self.collectionView = collectionV;
}



- (void)addTitleButton{
    NSInteger count = self.childViewControllers.count;
    CGFloat w = CHSCREENW / count;
    CGFloat x = 0;
    for (NSInteger i = 0; i < count; i ++) {
        
        UIViewController *vc = self.childViewControllers[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.tag = i;
        [btn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        x = i * w;
        btn.frame = CGRectMake(x, 0, w, self.topScrollV.height);
        [self.topScrollV addSubview:btn];
        [self.btnArray addObject:btn];
        if (i == 0) {
            [self selectedButton:btn];
            UIView *underLine = [[UIView alloc] init];
            underLine.backgroundColor = [UIColor redColor];
            CGFloat underLH = 2;
            CGFloat underLY = self.topScrollV.height - underLH;
            CGFloat underLW = btn.width * 0.5;
            CGFloat underLX = x + (btn.width - underLW) * 0.5;
            underLine.frame = CGRectMake(underLX, underLY, underLW, underLH);
            //NSLog(@"下划线%@", NSStringFromCGRect(underLine.frame));
            [self.topScrollV addSubview:underLine];
            self.underLine = underLine;
        }
        
    }
}
#pragma mark - 监听标题按钮的点击事件
- (void)titleBtnClick:(UIButton *)btn{
    [self selectedButton:btn];
    self.collectionView.contentOffset =CGPointMake(btn.tag * CHSCREENW, 0) ;
    
}
#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childViewControllers.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITableViewController *vc = self.childViewControllers[indexPath.row];
    //tableView的y值默认是20,需求的0,所以得修改y值为0
    
    vc.tableView.frame = [UIScreen mainScreen].bounds;
    vc.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.topScrollV.frame) + 20, 0, 49, 0);
    [cell.contentView addSubview:vc.view];
    
    //cell.backgroundColor = CHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / CHSCREENW;
    [self selectedButton:self.btnArray[page]];
}

#pragma mark - 记录选中的按钮
- (void)selectedButton:(UIButton *)button{
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    //下划线的x = 按钮的x + (按钮的宽度 - 下划线自己的宽度) *0.5
    self.underLine.x = button.tag * button.width  + (button.width - self.underLine.width) * 0.5;
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.hasChildVC) {
        
        [self addTitleButton];
        self.hasChildVC = YES;
    }
    //NSLog(@"子控制器个数%ld", self.childViewControllers.count);
}
@end
