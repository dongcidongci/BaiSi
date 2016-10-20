//
//  UIBarButtonItem+CHBarButtonItem.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "UIBarButtonItem+CHBarButtonItem.h"

@implementation UIBarButtonItem (CHBarButtonItem)


#pragma mark - 添加导航条按钮(设置图片/文字/监听方法/文字的颜色高亮为红色,默认为黑色)
+ (instancetype)barButtonCustomViewWithImage:(UIImage *)image highLightedImage:(UIImage *) highLightedImage title:(NSString *) title target:(id)target action:(nullable SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highLightedImage forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside ];
    [btn sizeToFit];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}
#pragma mark - 添加导航条按钮(设置选中图片/文字/监听方法/文字的颜色高亮为红色,默认为黑色)
+ (instancetype)barButtonCustomViewWithImage:(UIImage *)image selectedImage:(UIImage *) selectedImage title:(NSString *) title target:(id)target action:(nullable SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside ];
    [btn sizeToFit];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}


@end
