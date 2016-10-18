//
//  CHTabBar.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTabBar.h"

@interface CHTabBar ()
/**按钮 */
@property(weak, nonatomic) UIButton *button;

@end
@implementation CHTabBar

//+ (void)load{
//    CHTabBar *tabBar = [[CHTabBar alloc] init];
//    
//}
- (UIButton *)button{
    if (_button == nil) {
        UIButton *button = [[UIButton alloc] init];
        _button = button;
        [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return _button;
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat width = self.width;
    CGFloat height = self.height;
    //CGFloat margin = 20;
    CGFloat itemH = height;
    CGFloat itemW = width / self.items.count;
    CGFloat itemX = 0;
    CGFloat itemY = 0;
    //NSLog(@"%ld", self.items.count);
    for (int i = 0; i < self.items.count; i ++) {
        itemX = i * itemW;
        //CGRect frame = CGRectMake(itemX, itemY, itemW, itemH);
        //NSLog(@"%@", NSStringFromCGRect(frame));
        if (i == 2) {
            
            self.button.frame = CGRectMake(itemX, itemY, itemW, itemH);
        }
    }



}
#pragma mark - 监听按钮点击
- (void)publish{
    NSLog(@"%s", __func__);
}














@end
