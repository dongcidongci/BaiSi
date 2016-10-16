//
//  CHFriendTrendNavigationController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHFriendTrendNavigationController.h"
#import "UIImage+CHImage.h"

@interface CHFriendTrendNavigationController ()

@end

@implementation CHFriendTrendNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:[UIImage imageWithOriginalMode:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_friendTrends_click_icon"]];
    
}

@end
