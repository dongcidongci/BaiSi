//
//  CHMineViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHMineViewController.h"
#import <SafariServices/SafariServices.h>
#import "CHWebController.h"

#import "CHSettingTableViewController.h"
#import "CHSetiingCellItem.h"


#import "CHCollectionCellItem.h"
#import "CHCollectionVCell.h"

#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD.h>

@interface CHMineViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
/**设置显示模式的按钮 */
@property(weak, nonatomic) UIButton *nightModeBtn;
/**cell的模型 */
@property(strong, nonatomic) NSMutableArray *items;
/**collectionV的模型数据组*/
@property (nonatomic, strong)NSMutableArray *colletionVItem;
/**collectionV */
@property(weak, nonatomic) UICollectionView *collectionV;
@property(nonatomic, assign)NSInteger count;

@end

 static NSString * const ID = @"footer";
 static NSInteger const cols = 4;
 static CGFloat const margin = 1;
#define collectionViewWH (CHSCREENW - (cols - margin)) / cols

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
    UICollectionView *collectionV = [self setUpCollectionView];
    self.tableView.tableFooterView = collectionV;
    
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(84, 0, 0, 0);
    self.navigationItem.title = @"我的";
    //跳转设置界面按钮
    UIBarButtonItem *settingButton = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"mine-setting-icon"] highLightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] title:nil target:self action:@selector(setting)];
    //切换夜间/白天模式按钮
    UIBarButtonItem *nightMode = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] title:nil target:self action:@selector(changeMode:)];
    self.navigationItem.rightBarButtonItems = @[settingButton, nightMode];
    //添加模型数据
    [self setUpCellItem0];
    [self setUpCellItem1];
    //请求数据
    [self getStatuse];
    
}

- (void)getStatuse{
    [SVProgressHUD showWithStatus:@"正在为您加载数据..."];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"square";
    dict[@"c"] = @"topic";
    [manager GET:CHBaseUrl parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        [SVProgressHUD dismiss];
       NSArray *array = responseObject[@"square_list"];
         self.colletionVItem = [CHCollectionCellItem mj_objectArrayWithKeyValuesArray:array];
        [self.collectionV reloadData];
        [self remakeData];
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
//补全不够一行的数据(空的item,用来占位)
- (void)remakeData{
   NSInteger count = self.colletionVItem.count;
    //计算colletionView的行数的万能公式(总个数减去1之后除以列数,再+1)
    NSInteger lines = (count - 1) / cols + 1;
    CGFloat colletionVH = lines * collectionViewWH - (lines - 1) * margin;
    //内容的实际高度,再加上tableView的头部下垂下来的20和底部tabBar的高度,主要是为了增加tableView的滚动区域
    self.collectionV.height = colletionVH + 20 + 49;
    self.tableView.tableFooterView = self.collectionV;
    
   NSInteger owns = count % cols;
    if (owns) {
        owns = cols - owns;
        for (int i = 0; i < owns; i ++) {
            CHCollectionCellItem *collectionItem = [[CHCollectionCellItem alloc] init];
            [self.colletionVItem addObject:collectionItem];
        }
    }
    
}
#pragma mark - 设置模型数据
- (void)setUpCellItem0{
    CHSetiingCellGroupItem *groupItem0 = [CHSetiingCellGroupItem setiingCellGroupItem];
    CHSetiingCellItem *item0 = [CHSetiingCellItem setiingCellItemWithTitle:@"登录/注册" icon:@"publish-audio" controllerName:nil];
    NSArray *array = @[item0];
    groupItem0.groupItem = array;
    [self.items addObject:groupItem0];
    
}
- (void)setUpCellItem1{
    CHSetiingCellGroupItem *groupItem1 = [CHSetiingCellGroupItem setiingCellGroupItem];
    //如果要返回每个session的footterView,则要通过这个方式来,现在模型中记录,再通过代理方法来返回每个具体的view
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

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section == 1) {
//        
//        return 20;
//    }else
//        return 0;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15;
}
#pragma mark- 初始化collectionView
- (UICollectionView *)setUpCollectionView{
    //封装,作用类似于逗号表达式的功效,只会把最后一个分号的值返回给 = 前面的变量
    //创建布局方式
    UICollectionViewFlowLayout *flow = ({
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumLineSpacing = margin;
    flow.minimumInteritemSpacing = margin;
    flow.itemSize = CGSizeMake(collectionViewWH, collectionViewWH);
    flow;
        });
    //创建collectionView
    UICollectionView *collectionV = ({
    UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CHSCREENW, 300) collectionViewLayout:flow];
    collectionV.delegate = self;
    collectionV.dataSource = self;
    //注册collectionV的重用cell
    [collectionV registerClass:[CHCollectionVCell class] forCellWithReuseIdentifier:ID];
    collectionV.backgroundColor = [UIColor clearColor];
        //collectionV.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        collectionV.scrollEnabled = NO;
    self.collectionV = collectionV;
    collectionV;
        
    });
    
    return collectionV;
    
}


#pragma mark - UICollectionView数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.colletionVItem.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CHCollectionVCell *cell = [CHCollectionVCell collectionVCellWithCollectionV:collectionView ID:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    //取出数据,给cell的模型赋值,让他自己负责展示数据
    cell.cellItem = self.colletionVItem[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionView代理方法
//当选中了某个item的时候调用该方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    // 打开网页
    /*
     1.openURL:safari 
     优点:有很多好用的功能，前进，后退，刷新，地址栏，进度条
     弊端：必须要离开当前App
     
     2.UIWebView :
     优点：当前App打开网页
     弊端:没有功能，只能展示(只能自己写,而且不能监听进度)
     WKWebViw是iOS 8.0出的,比UIWebView要强大些
     他里面的东西都是通过KVO来实现监听属性值的改变的
     
     3.iOS9之后,苹果出了新的对象:SFSafariViewController
     优点:可以打开网页，而且是在当前App打开，而且有safari所有功能
     必须要导入<SafariServices/SafariServices.h>
     
     
     */
/*
    CHCollectionCellItem *item = self.colletionVItem[indexPath.item];
    //创建网络链接控制器
    SFSafariViewController *safariController = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:item.url]];
    [self presentViewController:safariController animated:YES completion:nil];
 */
    //使用WKWebView进行网页跳转
    CHCollectionCellItem *item = self.colletionVItem[indexPath.item];
    CHWebController *webViewC = [[CHWebController alloc] init];
    webViewC.url = [NSURL URLWithString:item.url];
    //[self presentViewController:webViewC animated:YES completion:nil];
    [self.navigationController pushViewController:webViewC animated:YES];
    
}










@end
