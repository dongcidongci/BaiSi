//
//  CHEssenceNavigationController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHEssenceNavigationController.h"
#import "UIImage+CHImage.h"

@interface CHEssenceNavigationController ()

@end

@implementation CHEssenceNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置item的文字和图片
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"精华" image:[UIImage imageWithOriginalMode:@"tabBar_essence_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_essence_click_icon"]];
    
    //设置字体的大小
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    //设置背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

@end
