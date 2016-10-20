//
//  CHNavigationController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/20.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHNavigationController.h"
#import "CHNavigationBar.h"
//#import "UIBarButtonItem+CHBarButtonItem.h"
#import "CHBackView.h"
@interface CHNavigationController ()

@end

@implementation CHNavigationController
+ (void)load{
    //定制全局导航条
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    //设置字体的大小
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    navigationBar.titleTextAttributes = dict;
    //设置背景图片
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    CHNavigationBar *navigationBar = [[CHNavigationBar alloc] initWithFrame:self.navigationBar.frame];
    [self setValue:navigationBar forKey:@"navigationBar"];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //NSLog(@"导航控制器");
    
    //当每个导航控制器的子控制器的个数大于1的时候才需要定制左边的返回按钮
    if (self.childViewControllers.count > 0) {
        CHBackView *view = [CHBackView backViewWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highLImage:[UIImage imageNamed:@"navigationButtonReturnClick"] title:@"返回" target:self action:@selector(back)];
        NSLog(@"导航控制器的左边按钮Frame%@", NSStringFromCGRect(view.frame));
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
        //NSLog(@"导航控制器");
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)back{
    [self popViewControllerAnimated:YES];
}
@end
