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
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"精华" image:[UIImage imageWithOriginalMode:@"tabBar_essence_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_essence_click_icon"]];
    
}

@end
