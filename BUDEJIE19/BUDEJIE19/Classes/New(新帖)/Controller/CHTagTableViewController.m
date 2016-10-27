//
//  CHTagTableViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTagTableViewController.h"
#import "CHTagCell.h"
#import "CHTagItem.h"
#import "CHView.h"

#import <AFHTTPSessionManager.h>
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD.h>

@interface CHTagTableViewController ()
/**<#注释#>*/
@property (nonatomic, strong)NSArray *tagCellItems;
@end

@implementation CHTagTableViewController

static NSString *const ID = @"tag";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataRequest];
    //根据ID注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CHTagCell" bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;


}
#pragma mark - 请求数据
- (void)dataRequest{
    [SVProgressHUD setStatus:@"正在加载数据..."];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[@"a"] = @"tag_recommend";
    dict[@"c"] = @"topic";
    dict[@"action"] = @"sub";
    [manager GET:CHBaseUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        //NSLog(@"%@", responseObject);
       self.tagCellItems = [CHTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        //NSLog(@"模型%@", self.tagCellItems);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //NSLog(@"%@", error);
    }];
}
//#pragma mark - 添加导航条左边item
//- (UIView *)leftNavigationBarItemView{
//    UIView *view = [[UIView alloc] init];
//    view.x = 0;
//    view.width = 80;
//    view.height = 40;
//    view.backgroundColor = [UIColor redColor];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//    [button setTitle:@"返回" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [button sizeToFit];
//    button.frame = view.bounds;
//    button.x = -20;
//    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:button];
//    return view;
//    
//}
//- (void)back{
//    
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"%ld", self.tagCellItems.count);
    return self.tagCellItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CHTagItem *item = self.tagCellItems[indexPath.row];
    CHTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.tagItem = item;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60 + 10;
}


@end
