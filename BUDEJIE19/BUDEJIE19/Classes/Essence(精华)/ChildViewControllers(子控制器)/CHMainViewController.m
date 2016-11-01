//
//  CHMainViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/23.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHMainViewController.h"
#import "CHNewViewController.h"
#import "UIView+CHWantedSubview.h"

#import "AFHTTPSessionManager+CHHTTPSessionManager.h"

#import <MJExtension/MJExtension.h>
#import "CHEssenceViewItem.h"
#import "CHAllItem.h"
#import "CHAllVCCell.h"
#import <MJRefresh/MJRefresh.h>

@interface CHMainViewController ()
/**全部模型*/
@property (nonatomic, strong)NSMutableArray *essenceVItemArr;
@property(nonatomic, strong)NSString *maxtime;

/**网络请求管理者*/
@property (nonatomic, weak)AFHTTPSessionManager *manager;
@end
/**下拉刷新的高度*/
#define pullDownR_V_H 35
/**下拉刷新控件完全显示时的偏移量绝对值*/
#define PullDownR_H (64 + 35 + pullDownR_V_H )
@implementation CHMainViewController
static NSString * const ID = @"mainCell";

- (NSMutableArray *)essenceVItemArr{
    if(_essenceVItemArr == nil){
        _essenceVItemArr = [NSMutableArray array];
    }
    return _essenceVItemArr;
}
- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager CHManager];
        
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CHAllVCCell class] forCellReuseIdentifier:ID];
    //请求数据
    [self requestData];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    //设置垂直指示器的内边距
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    //添加上拉刷新控件
    [self pullUpRefresh];
    //添加下拉刷新控件
    [self pullDownRefresh];
    //添加通知监听者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleClickRefresh) name:@"titleClick" object:nil];
    
}
- (void)titleClickRefresh{
    UITableView *tableView = [[UIApplication sharedApplication].keyWindow wantedSubview];
    [tableView.mj_header beginRefreshing];
}

//移除通知监听者
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 添加上拉刷新控件
- (void)pullUpRefresh{
    //创建上拉刷新控件
    MJRefreshAutoNormalFooter *footerRefreshV = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //没有数据的时候就不显示,有数据才显示
    footerRefreshV.automaticallyHidden = YES;
    //mj控件为scrollView写了分类,所以直接给mj的分类设置footer属性
    self.tableView.mj_footer = footerRefreshV;
}
#pragma mark - 添加下拉刷新控件
- (void)pullDownRefresh{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
    header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header = header;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.essenceVItemArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CHAllVCCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.essenceViewItem = self.essenceVItemArr[indexPath.row];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageCappedWithOriginalImage:[UIImage imageNamed:@"mainCellBackground"]]];
    //cell.backgroundColor = [UIColor redColor];
    return cell;
}
#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //加大10,是为了再给每个cell有个间距是10
    return [self.essenceVItemArr[indexPath.row] cellHeight] + 10;
}
#pragma mark - 滚动scrollView的时候会调用该方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}

#pragma mark - 上拉刷新数据时候的请求
- (void)loadMoreData{
    
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *parameters =[NSMutableDictionary dictionary];
    //CHNewViewController *vc = [[CHNewViewController alloc] init];
    
    parameters[@"a"] = @"list";
    if ([self.parentViewController isKindOfClass:[CHNewViewController class]]) {
        parameters[@"a"] = @"newlist";
    }
    parameters[@"c"] = @"data";
    //接口文档有详细的说明当上拉刷新的时候应该传maxtime参数去请求数据
    parameters[@"maxtime"] = self.maxtime;
    parameters[@"type"] = @(self.type);
    [self.manager GET:CHBaseUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //调用框架的方法,结束刷新数据提示
        [self.tableView.mj_footer endRefreshing];
        self.maxtime = responseObject[@"info"][@"maxtime"];
        //字典转模型
        NSArray *array = [CHAllItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        for (CHAllItem *item in array) {
            CHEssenceViewItem *essenceViewItem = [[CHEssenceViewItem alloc]init];
            essenceViewItem.allItem = item;
            [self.essenceVItemArr addObject:essenceViewItem];
        }
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    
}

#pragma mark - 请求最新数据
- (void)requestData{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    [self.tableView.mj_header beginRefreshing];
    NSMutableDictionary *parameters =[NSMutableDictionary dictionary];
    
    parameters[@"a"] = @"list";
    if ([self.parentViewController isKindOfClass:[CHNewViewController class]]) {
        parameters[@"a"] = @"newlist";
        //NSLog(@"%s", __func__);
    }
    parameters[@"c"] = @"data";
    
    parameters[@"type"] = @(self.type);
    [self.manager GET:CHBaseUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //结束刷新数据状态
        [self.tableView.mj_header endRefreshing];
        //保存Maxtime到内存缓存
        self.maxtime = responseObject[@"info"][@"maxtime"];
        //最原始的内边距
        self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
        //字典转模型
        NSArray *array = [CHAllItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (CHAllItem *item in array) {
            CHEssenceViewItem *essenceViewItem = [[CHEssenceViewItem alloc]init];
            essenceViewItem.allItem = item;
            [arrayM addObject:essenceViewItem];
        }
        //把最新的数据覆盖原来的数据(用户下拉刷新的时候看到的都是最新的数据)
        self.essenceVItemArr = arrayM;
        //NSLog(@"%@", self.essenceVItemArr);
        [self.tableView reloadData];
        //[responseObject writeToFile:@"/Users/moxuyou/Desktop/汪春宏项目准备/day01/essence.plist" atomically:YES];
        //NSLog(@"%@", self.essenceVItemArr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
