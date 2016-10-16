//
//  CHNewNavigationController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHNewNavigationController.h"
#import "UIImage+CHImage.h"

@interface CHNewNavigationController ()

@end

@implementation CHNewNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新帖" image:[UIImage imageWithOriginalMode:@"tabBar_new_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_new_click_icon"]];
}

@end
