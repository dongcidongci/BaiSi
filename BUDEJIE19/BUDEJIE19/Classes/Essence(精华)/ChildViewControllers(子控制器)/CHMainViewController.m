//
//  CHMainViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/23.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHMainViewController.h"

#import "AFHTTPSessionManager+CHHTTPSessionManager.h"

#import <MJExtension/MJExtension.h>
#import "CHEssenceViewItem.h"
#import "CHAllItem.h"
#import "CHAllVCCell.h"
@interface CHMainViewController ()
/**全部模型*/
@property (nonatomic, strong)NSMutableArray *essenceVItemArr;
@end

@implementation CHMainViewController
static NSString * const ID = @"mainCell";
- (NSMutableArray *)essenceVItemArr{
    if(_essenceVItemArr == nil){
        _essenceVItemArr = [NSMutableArray array];
    }
    return _essenceVItemArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[CHAllVCCell class] forCellReuseIdentifier:ID];
    //请求数据
    [self requestData];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
}
#pragma mark - 请求数据
- (void)requestData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager CHManager];
    NSMutableDictionary *parameters =[NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(kCHTopicTypePhoto);
    [manager GET:CHBaseUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //字典转模型
        NSArray *array = [CHAllItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        for (CHAllItem *item in array) {
            CHEssenceViewItem *essenceViewItem = [[CHEssenceViewItem alloc]init];
            essenceViewItem.allItem = item;
            [self.essenceVItemArr addObject:essenceViewItem];
        }
        //NSLog(@"%@", self.essenceVItemArr);
        [self.tableView reloadData];
        //[responseObject writeToFile:@"/Users/moxuyou/Desktop/汪春宏项目准备/day01/essence.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.essenceVItemArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CHAllVCCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.essenceViewItem = self.essenceVItemArr[indexPath.row];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageCappedWithOriginalImage:[UIImage imageNamed:@"mainCellBackground"]]];
    return cell;
}
#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   //CGFloat h = [self.essenceVItemArr[indexPath.row] cellHeight];
    //NSLog(@"cell的高度%lf", h);
    //加大10,是为了再给每个cell有个间距是10
    return [self.essenceVItemArr[indexPath.row] cellHeight] + 10;
}

@end
