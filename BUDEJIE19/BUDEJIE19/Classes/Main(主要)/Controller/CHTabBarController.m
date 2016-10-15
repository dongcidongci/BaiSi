//
//  CHTabBarController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTabBarController.h"

@interface CHTabBarController ()

@end

@implementation CHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *VCNames = @[
                         @"CHEssenceViewController",
                         @"CHMineViewController",
                         @"CHNewViewController",
                         @"CHPublishViewController",
                         @"CHFriendTrendViewController"
                         ];
    for (int i = 0; i < VCNames.count; i ++) {
        UIViewController *vc = [[NSClassFromString(VCNames[i]) alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
    
    
    
    
    
    
}










@end
