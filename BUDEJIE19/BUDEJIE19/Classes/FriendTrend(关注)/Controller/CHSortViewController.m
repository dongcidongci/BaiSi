//
//  CHSortViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/31.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSortViewController.h"
#import "AFHTTPSessionManager+CHHTTPSessionManager.h"

#import "CHCategoryItem.h"
#import "CHUserItem.h"
#import <MJExtension/MJExtension.h>
#import "CHLeftCell.h"
#import "CHRightCell.h"
#import <MJRefresh/MJRefresh.h>
#import <SVProgressHUD.h>

@interface CHSortViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
/**网络请求管理者 */
@property(weak, nonatomic) AFHTTPSessionManager *manager;
/**类别组合*/
@property (nonatomic, strong)NSArray *categorys;
/**选中的类别*/
@property (nonatomic, strong)CHCategoryItem *selectCategory;
@end

static NSString * const leftID = @"leftCell";
static NSString * const rightID = @"rightCell";
@implementation CHSortViewController
- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager CHManager];
        
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self loadData];
    //添加上拉刷新控件
    [self pullUpRefresh];
    //添加下拉刷新控件
    [self pullDownRefresh];
    [SVProgressHUD showWithStatus:@"正在加载数据"];
}
//初始化tableView
- (void)setUpTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.rightTableView.contentInset = self.leftTableView.contentInset;
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
    self.leftTableView.backgroundColor = [UIColor whiteColor];
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    
    [self.leftTableView registerNib:[UINib nibWithNibName:@"CHLeftCell" bundle:nil] forCellReuseIdentifier:leftID];
    [self.rightTableView registerNib:[UINib nibWithNibName:@"CHRightCell" bundle:nil] forCellReuseIdentifier:rightID];
}
#pragma mark -上拉刷新
- (void)pullUpRefresh{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsersData)];
    footer.automaticallyHidden = YES;
    self.rightTableView.mj_footer = footer;
}
#pragma mark -下拉刷新
- (void)pullDownRefresh{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadUserData)];
    self.rightTableView.mj_header = header;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"%ld",self.categorys.count );
    if (tableView == self.leftTableView) return self.categorys.count;
    //NSLog(@"cell%ld",self.selectCategory.users.count );
    return self.selectCategory.users.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (tableView == self.leftTableView) {
        
        CHLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:leftID];
        CHCategoryItem *item = self.categorys[indexPath.row];
        cell.item = item;
        return cell;
    }
    CHRightCell *cell = [tableView dequeueReusableCellWithIdentifier:rightID];
    CHUserItem *userItem = self.selectCategory.users[indexPath.row];
    cell.userItem = userItem;
    return cell;
    
}
#pragma mark - 加载左边分类的数据
- (void)loadData{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"category";
    dict[@"c"] = @"subscribe";
    
   
    [self.manager GET:CHBaseUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
      
        [SVProgressHUD dismiss];
        //[responseObject writeToFile:@"/Users/moxuyou/Desktop/汪春宏项目准备/day03/category.plist" atomically:YES];
        self.categorys = [CHCategoryItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.leftTableView reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self tableView:self.leftTableView didSelectRowAtIndexPath:indexPath];
        [self.leftTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
#pragma mark - 加载类别对应的用户(第一次)
- (void)loadUserData{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    //给用户的页数初始化为1,每个类别下至少会有一页数据
    self.selectCategory.pageNumber = 1;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"list";
    dict[@"c"] = @"subscribe";
    //NSLog(@"更多%@", self.selectCategory.id);
    dict[@"category_id"] = self.selectCategory.id;
    [self.manager GET:CHBaseUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        [self.rightTableView.mj_header endRefreshing];
       // [responseObject writeToFile:@"/Users/moxuyou/Desktop/汪春宏项目准备/day03/user.plist" atomically:YES];
        NSInteger total_page = [responseObject[@"total_page"] integerValue];
        self.selectCategory.users = [CHUserItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        CHCategoryItem *item = self.selectCategory;
//        item.users = users;
        item.total_page = total_page;
        //self.selectCategory = item;

       
        [self.rightTableView reloadData];
        self.rightTableView.mj_footer.hidden = self.selectCategory.total_page <= self.selectCategory.pageNumber;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark - 加载类别对应的用户(加载更多)
- (void)loadMoreUsersData{
    
    //如果总页数就1页,结束加载
//    if (self.selectCategory.total_page <= 1) return;
    //如果加载的页数大于了总页数,结束加载
//    if (self.selectCategory.pageNumber > self.selectCategory.total_page) return;
    if(self.selectCategory.total_page <= 1 || self.selectCategory.pageNumber > self.selectCategory.total_page ){
        [self.rightTableView.mj_footer endRefreshing];
        self.rightTableView.mj_footer.hidden = YES;
        return;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"list";
    dict[@"c"] = @"subscribe";
    //NSLog(@"更多%@", self.selectCategory.id);
    dict[@"category_id"] = self.selectCategory.id;
    dict[@"page"] = @(self.selectCategory.pageNumber);
    [self.manager GET:CHBaseUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        // [responseObject writeToFile:@"/Users/moxuyou/Desktop/汪春宏项目准备/day03/user.plist" atomically:YES];
        self.selectCategory.pageNumber++;
        
        NSArray *users = [CHUserItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        CHCategoryItem *item = self.selectCategory;
        //这个方法就是在数组后面再添加数组的元素
        [item.users addObjectsFromArray:users];
        //self.selectCategory = item;
        [self.rightTableView reloadData];
        [self.rightTableView.mj_footer endRefreshing];
        self.rightTableView.mj_footer.hidden = self.selectCategory.pageNumber >= self.selectCategory.total_page;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        
        self.selectCategory = self.categorys[indexPath.row];
        if(self.selectCategory){
            [self loadUserData];
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _rightTableView) return 60;
    return 44;
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
}
@end
