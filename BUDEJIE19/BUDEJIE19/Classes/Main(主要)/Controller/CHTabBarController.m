//
//  CHTabBarController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTabBarController.h"
#import "CHTabBar.h"

@interface CHTabBarController ()

@end

@implementation CHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *VCNames = @[
                         @"CHEssenceViewController",
                         @"CHNewViewController",
                         @"CHPublishViewController",
                         @"CHFriendTrendViewController",
                         @"CHMineViewController"
                         ];
    NSArray *navigationVC = @[
                              @"CHEssenceNavigationController",
                              @"CHNewNavigationController",
                              @"CHPublishNavigationController",
                              @"CHFriendTrendNavigationController",
                              @"CHMineNavigationController"
                              ];
    for (int i = 0; i < VCNames.count; i ++) {
        UIViewController *vc = [[NSClassFromString(VCNames[i]) alloc] init];
        UINavigationController *nav = [[NSClassFromString(navigationVC[i]) alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
    
    CHTabBar *tabBar = [[CHTabBar alloc] init];
    
    //设置导航控制器的整体颜色
    tabBar.tintColor = [UIColor colorWithRed:142 / 225.5  green:142 / 225.5  blue:142 / 225.5  alpha:1];
    //KVC修改属性值
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    
    
    
    
}










@end
