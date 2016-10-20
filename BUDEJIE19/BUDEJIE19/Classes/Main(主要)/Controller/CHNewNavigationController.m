//
//  CHNewNavigationController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHNewNavigationController.h"
#import "UIImage+CHImage.h"
#import "CHNavigationBar.h"

@interface CHNewNavigationController ()

@end

@implementation CHNewNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CHNavigationBar *navigationBar = [[CHNavigationBar alloc] init];
    [self setValue:navigationBar forKeyPath:@"navigationBar"];
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新帖" image:[UIImage imageWithOriginalMode:@"tabBar_new_icon"] selectedImage:[UIImage imageWithOriginalMode:@"tabBar_new_click_icon"]];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:[self leftNavigationBarItemView]];
    }
    
    [super pushViewController:viewController animated:animated];
}
#pragma mark - 添加导航条左边item
- (UIView *)leftNavigationBarItemView{
    UIView *view = [[UIView alloc] init];
    view.x = 0;
    view.width = 80;
    view.height = 40;
    view.backgroundColor = [UIColor redColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    button.frame = view.bounds;
    button.x = -20;
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return view;
    
}
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
