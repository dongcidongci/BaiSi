//
//  CHNavigationController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/20.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHNavigationController.h"
#import "CHNavigationBar.h"
#import "CHBackView.h"
@interface CHNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation CHNavigationController
+ (void)load{
    /*****定制全局导航条样式*****/
    //只有被苹果标有__APPEARANCE__的属性,才能进行统一设置
    CHNavigationBar *navigationBar = [CHNavigationBar appearanceWhenContainedIn:self, nil];
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
    //利用KVC对系统的私有属性进行赋值
    [self setValue:navigationBar forKey:@"navigationBar"];
    /*interactivePopGestureRecognizer苹果用父类来定义的属性,他的真实类型是
    UIScreenEdgePanGestureRecognizer ,继承自UIPanGestureRecognizer
     */
    self.interactivePopGestureRecognizer.enabled = NO;
    //NSLog(@"%@", self.interactivePopGestureRecognizer);
    /* self.interactivePopGestureRecognizer (7_0)
     <UIScreenEdgePanGestureRecognizer: 0x7f89cae21510; state = Possible; enabled = NO; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7f89cad4e6a0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7f89cae20f40>)>>
     */
    id delegate = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    
}
#pragma mark - 代理决定 根控制器pan手势就不能接收点击
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.childViewControllers.count > 0) return YES;
  
    return NO;
   
}
//init方法底层会来调用push方法,把控制器进行 入栈 操作
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //当每个导航控制器的子控制器的个数大于1的时候才需要定制左边的返回按钮
    if (self.childViewControllers.count > 0) {
        CHBackView *view = [CHBackView backViewWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highLImage:[UIImage imageNamed:@"navigationButtonReturnClick"] title:@"返回" target:self action:@selector(back)];
        //NSLog(@"导航控制器的左边按钮Frame%@", NSStringFromCGRect(view.frame));
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
        //NSLog(@"导航控制器");
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

#pragma mark - 监听 导航控制器下的导航条左边按钮 的点击事件
- (void)back{
    //出栈
    [self popViewControllerAnimated:YES];
}
@end
