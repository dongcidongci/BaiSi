//
//  CHTagTableViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTagTableViewController.h"
#import "CHTagCell.h"
#import "CHView.h"

#import <AFHTTPSessionManager.h>

@interface CHTagTableViewController ()

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
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[@"a"] = @"tag_recommend";
    dict[@"c"] = @"topic";
    dict[@"action"] = @"sub";
    [manager GET:CHBaseUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
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

    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CHTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //NSLog(@"%p", cell);
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60 + 10;
}


@end
