//
//  CHRecomandViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHRecomandViewController.h"
#import "CHView.h"
@implementation CHRecomandViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addNavigationBar];
    //self.navigationItem.title = @"推荐标签";
}


#pragma mark - 添加导航控制器的顶部view
- (void)addNavigationBar{
    CHView *view = [[CHView alloc]init];
    view.frame = CGRectMake(0, 0, self.view.width, 64);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    button.y = view.height * 0.5;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lable = [[UILabel alloc] init];
    lable.text = @"推荐标签";
   // lable.backgroundColor = [UIColor redColor];
    //lable.center = CGPointMake(view.width * 0.5, view.height * 0.5);
    lable.width = 80;
    lable.height = 30;
    lable.x = (view.width - lable.width) * 0.5;
    lable.y = (view.height - lable.height) * 0.5 + 10;
    //[lable sizeToFit];
    [view addSubview:lable];
    [view addSubview:button];
    [self.view addSubview:view];
}
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = NO;
}
@end
