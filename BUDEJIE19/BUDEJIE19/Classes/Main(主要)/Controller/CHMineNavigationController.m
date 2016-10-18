//
//  CHMineNavigationController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHMineNavigationController.h"
#import "UIImage+CHImage.h"

@interface CHMineNavigationController ()

@end

@implementation CHMineNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageWithOriginalMode:@"tabBar_me_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_me_click_icon"]];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    
}

@end
