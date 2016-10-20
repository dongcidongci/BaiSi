//
//  CHMineViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHMineViewController.h"
#import "CHSettingTableViewController.h"
#import "CHSetiingCellItem.h"

#import "CHCollectionView.h"
#import "CHCollectionCellItem.h"
#import "CHCollectionVCell.h"

#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>

@interface CHMineViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
/**设置显示模式的按钮 */
@property(weak, nonatomic) UIButton *nightModeBtn;
/**cell的模型 */
@property(strong, nonatomic) NSMutableArray *items;
/**collectionV的模型数据组*/
@property (nonatomic, strong)NSArray *colletionVItem;
/**collectionV */
@property(weak, nonatomic) UICollectionView *collectionV;

@end

 static NSString * const ID = @"footer";
@implementation CHMineViewController
- (NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
        //NSLog(@"%p", _items);
    }
    return _items;
}
//- (NSMutableArray *)colletionVItem{
//    if (_colletionVItem == nil) {
//       _colletionVItem = [NSMutableArray array];
//    }
//    return _colletionVItem;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    //请求数据
    [self getStatuse];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.navigationItem.title = @"我的";
    //跳转设置界面按钮
    UIBarButtonItem *settingButton = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"mine-setting-icon"] highLightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] title:nil target:self action:@selector(setting)];
    //切换夜间/白天模式按钮
    UIBarButtonItem *nightMode = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] title:nil target:self action:@selector(changeMode:)];
    self.navigationItem.rightBarButtonItems = @[settingButton, nightMode];
    //添加模型数据
    [self setUpCellItem0];
    [self setUpCellItem1];
}

- (void)getStatuse{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"square";
    dict[@"c"] = @"topic";
    [manager GET:CHBaseUrl parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
       NSArray *array = responseObject[@"square_list"];
        NSMutableArray *arrayM = [NSMutableArray array];
         arrayM = [CHCollectionCellItem mj_objectArrayWithKeyValuesArray:array];
        self.colletionVItem = arrayM;
        //NSLog(@"%@成功", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //NSLog(@"%@失败", error);
    }];
}

- (void)setUpCellItem0{
    CHSetiingCellGroupItem *groupItem0 = [CHSetiingCellGroupItem setiingCellGroupItem];
    CHSetiingCellItem *item0 = [CHSetiingCellItem setiingCellItemWithTitle:@"登录/注册" icon:@"publish-audio" controllerName:nil];
    NSArray *array = @[item0];
    groupItem0.groupItem = array;
    [self.items addObject:groupItem0];
    
}
- (void)setUpCellItem1{
    CHSetiingCellGroupItem *groupItem1 = [CHSetiingCellGroupItem setiingCellGroupItem];
    groupItem1.footer = YES;
    CHSetiingCellItem *item1 = [CHSetiingCellItem setiingCellItemWithTitle:@"离线下载" icon:@"" controllerName:nil];
    NSArray *array = @[item1];
    groupItem1.groupItem = array;
    [self.items addObject:groupItem1];
    
}
#pragma mark -跳转设置界面
- (void)setting{
    CHSettingTableViewController *settingVc = [[CHSettingTableViewController alloc]init];
    settingVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVc animated:YES];
    
}
#pragma mark -监听夜间和白天模式的切换
- (void)changeMode:(UIButton *)button{
    NSLog(@"夜间模式的切换按钮");
    button.selected = !button.selected;
    
    
}

#pragma mark - UITableView数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.items.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CHSetiingCellGroupItem *groupItem = self.items[section];
    //NSLog(@"%@", [groupItem.groupItem class]);
    NSArray *array = groupItem.groupItem;
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"login";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    CHSetiingCellGroupItem *groupItem = self.items[indexPath.section];
    CHSetiingCellItem *item = groupItem.groupItem[indexPath.row];
    cell.textLabel.text = item.title;
    cell.imageView.image = [UIImage imageNamed:item.icon];
    
    return cell;
    
}
#pragma mark- UITableView代理方法
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 60;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
//假设模型个数
//NSInteger i = 50;
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    CHSetiingCellGroupItem *groupItem = self.items[section];
    if (groupItem.isFooter) {
        //UISwitch *s = [[UISwitch alloc] init];
        //return s;
      UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        CGFloat w = (CHSCREENW - 3) / 4;
        flow.itemSize = CGSizeMake(w, w);
        CGFloat h = flow.itemSize.height * self.colletionVItem.count;
        UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CHSCREENW, h) collectionViewLayout:flow];
        collectionV.delegate = self;
        collectionV.dataSource = self;
        [collectionV registerClass:[CHCollectionVCell class] forCellWithReuseIdentifier:ID];
        return collectionV;
        
        /*
        CHCollectionView *collectionView = [CHCollectionView collectionView];
        //collectionView.backgroundColor = [UIColor redColor];//无效,体现不出这个颜色
        //xy值无论是多少,搜没有作用,因为系统不给你改xy值的
        collectionView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        CHCollectionCellItem *item = [CHCollectionCellItem collectionCellItemDict:@{@"title" : @"关注", @"icon" : @"publish-audio"}];
        collectionView.cellItem = item;
        return collectionView;
        */
        
    }else{
        return nil;
    }
}
#pragma mark - 尾部视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CHSetiingCellGroupItem *groupItem = self.items[section];
    if (groupItem.isFooter) {
        
        return CHSCREENH - 49 - 64 - 2 * (44 + 20);
    }else{
        return 0;
    }
}


#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.colletionVItem.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CHCollectionVCell *cell = [CHCollectionVCell collectionVCellWithCollectionV:collectionView ID:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.cellItem = self.colletionVItem[indexPath.row];
    //cell.cellItem = self.items[indexPath.row];
    //NSLog(@"cellForItemAtIndexPath");
    return cell;
}














@end
