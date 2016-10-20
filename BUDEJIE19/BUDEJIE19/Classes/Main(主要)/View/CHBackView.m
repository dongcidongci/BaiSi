//
//  CHBackView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/20.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHBackView.h"


@implementation CHBackView

#pragma mark - 添加导航控制条左边返回按钮
+ (instancetype)backViewWithImage:(UIImage *)image highLImage:(UIImage *)highLImage title:(NSString *)title target:(id)target action:(nonnull SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highLImage forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside ];
    [btn sizeToFit];
    CHBackView *view = [[CHBackView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    
    return view;
}

@end
