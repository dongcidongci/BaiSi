//
//  CHTopWindow.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/31.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTopWindow.h"
#import "UIView+CHWantedSubview.h"

@interface CHTopWindow ()

@end

static UIWindow *_myWindow;

@implementation CHTopWindow

+ (void)show{
    //创建一个窗口,添加到最上面显示
    CHTopWindow *window = [[CHTopWindow alloc] init];
    //窗口一定要有根控制器
    UIViewController *vc = [[UIViewController alloc] init];
    window.rootViewController = vc;
    window.frame = CGRectMake(0, 0, CHSCREENW, 20);
    window.backgroundColor = [UIColor clearColor];
    window.windowLevel = UIWindowLevelAlert;
    window.hidden = NO;
    //超过2个窗口的时候,状态栏就会隐藏
    [UIApplication sharedApplication].statusBarHidden = NO;
    _myWindow = window;
    //还有一个注意点就是:默认是控制器管理状态栏的,想要UIApplication来设置状态栏,必须要更改info.plist文件
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //拿到主窗口
   UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //在主窗口上找tableView
   UITableView *tableV = [window wantedSubview];
    //设置tableView的偏移量为最初的偏移量
    [tableV setContentOffset:CGPointMake(0, -tableV.contentInset.top) animated:YES];
}

@end
