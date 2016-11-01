//
//  CHSettingTableViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSettingTableViewController.h"
#import "CHView.h"
#import <SVProgressHUD.h>
#import "CHFileManager.h"


@implementation CHSettingTableViewController
- (void)viewDidLoad{
    [super viewDidLoad];
   
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
//    [CHFileManager stringFromDirectorySizeAtPath:CachePath completion:^(NSString *text) {
//        cell.textLabel.text = text;
//    }];
    cell.textLabel.text = @"清理缓存";//[self cellText];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"%@", CachePath);
    [SVProgressHUD showWithStatus:@"查询可删除缓存文件..."];
    
    [CHFileManager stringFromDirectorySizeAtPath:CachePath completion:^(NSString *text) {
        
        [SVProgressHUD showSuccessWithStatus:text];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }];

    

    [CHFileManager deleteStatuseAtPath:CachePath];
    [self.tableView reloadData];
    
}
//删除沙盒目录下的缓存文件夹
- (void)deleteStatuse{
    
    [[NSFileManager defaultManager] removeItemAtPath:CachePath error:nil];
    [[NSFileManager defaultManager] createDirectoryAtPath:CachePath withIntermediateDirectories:YES attributes:nil error:nil];
    
}
#pragma mark -处理cell展示的文字
- (NSString *)cellText{
   NSInteger size = [self getDocumentSize];
    CGFloat sizeFloat = 0;
    NSString *basicText = @"清除缓存";
    NSString *text = nil;
    //在手机的计算单位是1000的,而不是普遍认为的1024
    if (size > 1000 * 1000) {
       sizeFloat = size / 1000.0 / 1000.0;
        text = [basicText stringByAppendingString:[NSString stringWithFormat:@"(%0.1lfMB)", sizeFloat]];
    }else if (size > 1000){
        sizeFloat = size / 1000.0;
        text = [basicText stringByAppendingString:[NSString stringWithFormat:@"(%0.1lfKB)", sizeFloat]];
        
    }else if(size > 0){
        text = [basicText stringByAppendingString:[NSString stringWithFormat:@"%ldB", size]];
    }
    [text stringByReplacingOccurrencesOfString:@".0" withString:@""];
    return text;
}
#pragma mark - 获取磁盘缓存文件的大小
- (NSInteger)getDocumentSize{
    NSFileManager *manager = [NSFileManager defaultManager];
    //获取缓存的沙盒路径(文件夹的路径)
    NSString *cachePath = CachePath;
    //获取沙盒路径下的文件路径(有可能是文件夹下面还有文件夹的)
    NSArray *array = [manager subpathsAtPath:cachePath];
    //拼接文件的全路径
    NSInteger totalySize = 0;
    
    for (NSString *path in array) {
        //NSString *fileName = [path lastPathComponent];
        NSString *fullPath = [cachePath stringByAppendingPathComponent:path];
        //判断是不是隐藏文件夹
        if ([fullPath containsString:@".DS"]) {
            //返回,重新循环
            continue;
        }
        //判断是不是文件夹
        BOOL isDiretory = NO;
        BOOL isExsists = [manager fileExistsAtPath:fullPath isDirectory:&isDiretory];
        if (isDiretory || !isExsists) {
            continue;
        }
        //遍历取出每个文件的文件大小
        NSDictionary *dict = [manager attributesOfItemAtPath:fullPath error:nil];
        //累加文件的大小
        totalySize += [dict fileSize];
    }
    
    
    
    //把得到的文件总大小返回出去给调用者
    
   return totalySize;
}

#pragma mark - 添加导航控制器的顶部view
//- (void)addNavigationBar{
//    CHView *view = [[CHView alloc]init];
//    view.frame = CGRectMake(0, -20, self.view.width, 64);
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//    [button setTitle:@"返回" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [button sizeToFit];
//    button.y = view.height * 0.5;
//    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:button];
//    [self.view addSubview:view];
//}
//- (void)back{
//    
//    [self.navigationController popViewControllerAnimated:YES];
//    self.navigationController.navigationBar.hidden = NO;
//}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
//}
@end
