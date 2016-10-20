//
//  CHSettingTableViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSettingTableViewController.h"
#import "CHView.h"

@implementation CHSettingTableViewController
- (void)viewDidLoad{
    [super viewDidLoad];
   
    
}
#pragma mark - 添加导航控制器的顶部view
- (void)addNavigationBar{
    CHView *view = [[CHView alloc]init];
    view.frame = CGRectMake(0, -20, self.view.width, 64);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    button.y = view.height * 0.5;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [self.view addSubview:view];
}
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = NO;
}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
//}
@end
