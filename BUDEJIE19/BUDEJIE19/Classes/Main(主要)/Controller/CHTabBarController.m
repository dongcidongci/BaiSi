//
//  CHTabBarController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTabBarController.h"
#import "CHTabBar.h"

#import "CHNavigationController.h"

#import "CHEssenceViewController.h"
#import "CHNewViewController.h"
#import "CHFriendTrendViewController.h"
#import "CHMineViewController.h"

#import "UIImage+CHImage.h"

@interface CHTabBarController ()

@end

@implementation CHTabBarController
+(void)load{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedIn:[CHTabBar class], nil];
    //设置字体的大小
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
   

}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self addChildController];
    
    CHTabBar *tabBar = [[CHTabBar alloc] init];
    //设置导航控制器的整体颜色
    tabBar.tintColor = [UIColor blackColor];
    //KVC修改属性值
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    
    
    
    
    
    
}
#pragma mark- 添加子控制器
- (void)addChildController{
    //精华
    CHEssenceViewController *essenceVC = [[CHEssenceViewController alloc] init];
    CHNavigationController *navE = [[CHNavigationController alloc] initWithRootViewController:essenceVC];
    navE.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"精华" image:[UIImage imageWithOriginalMode:@"tabBar_essence_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_essence_click_icon"]];
    
    [self addChildViewController:navE];
    
    //新帖
    CHNewViewController *newVC = [[CHNewViewController alloc] init];
    CHNavigationController *navN = [[CHNavigationController alloc] initWithRootViewController:newVC];
    navN.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新帖" image:[UIImage imageWithOriginalMode:@"tabBar_new_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_new_click_icon"]];
    
    [self addChildViewController:navN];
    //发布
    CHEssenceViewController *publishVC = [[CHEssenceViewController alloc] init];
    //CHNavigationController *navP = [[CHNavigationController alloc] initWithRootViewController:publishVC];
    
    [self addChildViewController:publishVC];
    
    //关注
    CHFriendTrendViewController *friendTVC = [[CHFriendTrendViewController alloc] init];
    CHNavigationController *navF = [[CHNavigationController alloc] initWithRootViewController:friendTVC];
    navF.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:[UIImage imageWithOriginalMode:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_friendTrends_click_icon"]];;
    
    [self addChildViewController:navF];
    //我
    CHMineViewController *meVC = [[CHMineViewController alloc] init];
    CHNavigationController *navM = [[CHNavigationController alloc] initWithRootViewController:meVC];
    navM.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageWithOriginalMode:@"tabBar_me_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_me_click_icon"]];;
    
    [self addChildViewController:navM];
    
    
    
    
    
    
    /*
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
        CHNavigationController *nav = [[CHNavigationController alloc] initWithRootViewController:vc];
        //UINavigationController *nav = [[NSClassFromString(navigationVC[i]) alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    
    }
      */
}









@end
