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

@interface CHMineViewController ()/**设置显示模式的按钮 */
@property(weak, nonatomic) UIButton *nightModeBtn;
/**cell的模型 */
@property(strong, nonatomic) NSMutableArray *items;
@end

@implementation CHMineViewController
- (NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
        //NSLog(@"%p", _items);
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.navigationItem.title = @"我的";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //跳转设置界面按钮
    UIBarButtonItem *settingButton = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"mine-setting-icon"] highLightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] title:nil target:self action:@selector(setting)];
    //切换夜间/白天模式按钮
    UIBarButtonItem *nightMode = [self barButtonCustomViewWithImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] title:nil target:self action:@selector(changeMode)];
    self.navigationItem.rightBarButtonItems = @[settingButton, nightMode];
    //添加模型数据
    [self setUpCellItem0];
    [self setUpCellItem1];
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
- (void)changeMode{
    self.nightModeBtn.selected = !self.nightModeBtn.selected;
    
    
}
#pragma mark - 添加导航条按钮(设置选中图片/文字/监听方法/文字的颜色高亮为红色,默认为黑色)
- (UIBarButtonItem *)barButtonCustomViewWithImage:(UIImage *)image selectedImage:(UIImage *) selectedImage title:(NSString *) title target:(id)target action:(nullable SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside ];
    [btn sizeToFit];
    self.nightModeBtn = btn;
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}
#pragma mark - 数据源方法
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
#pragma mark- 代理方法
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 60;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    CHSetiingCellGroupItem *groupItem = self.items[section];
    if (groupItem.isFooter) {
        CHCollectionView *collectionView = [CHCollectionView collectionView];
        //collectionView.backgroundColor = [UIColor redColor];//无效,体现不出这个颜色
        collectionView.frame = CGRectMake(0, 100, self.view.width, 300);
        CHCollectionCellItem *item = [CHCollectionCellItem collectionCellItemDict:@{@"title" : @"关注", @"icon" : @"publish-audio"}];
        collectionView.cellItem = item;
        return collectionView;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CHSetiingCellGroupItem *groupItem = self.items[section];
    if (groupItem.isFooter) {
        
        return 1000;
    }else{
        return 0;
    }
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}





@end
