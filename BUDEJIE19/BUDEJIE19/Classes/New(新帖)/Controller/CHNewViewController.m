 //
//  CHNewViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHNewViewController.h"
#import "CHTagTableViewController.h"

@interface CHNewViewController ()

@end

@implementation CHNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highLightedImage:[UIImage imageNamed:@"MainTagSubIconClick"] title:nil target:self action:@selector(subMenu)];
    //设置TitleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    
}
- (void)subMenu{
    CHTagTableViewController *tagVC = [[CHTagTableViewController alloc]init];
    tagVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tagVC animated:YES];
}


@end
