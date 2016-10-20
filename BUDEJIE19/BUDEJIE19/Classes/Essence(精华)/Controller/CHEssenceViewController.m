//
//  CHEssenceViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHEssenceViewController.h"
#import "CHRecomandViewController.h"

@interface CHEssenceViewController ()

@end

@implementation CHEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航条左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highLightedImage:[UIImage imageNamed:@"MainTagSubIconClick"] title:nil target:self action:@selector(suMenu)];
    //添加导航条右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highLightedImage:[UIImage imageNamed:@"navigationButtonRandomClick"] title:nil target:nil action:nil];
    //设置TitleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];

    
}
- (void)suMenu{
    CHRecomandViewController *recomandVC = [[CHRecomandViewController alloc] init];
    [self.navigationController pushViewController:recomandVC animated:YES];
}



@end
