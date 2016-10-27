//
//  UIBarButtonItem+CHBarButtonItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CHBarButtonItem)

/**UIBarButtonItem (普通和高亮状态)
 *image 普通状态图片
 *highLightedImage 高亮状态图片
 *title 按钮标题 文字颜色高亮下是红色,普通状态是黑色
 *target 方法的拥有者
 *action 点击按钮会调用的方法
 */
+ (nonnull instancetype)barButtonCustomViewWithImage:(nullable UIImage *)image highLightedImage:(nullable UIImage *) highLightedImage title:(nullable NSString *) title target:(nullable id)target action:(nullable SEL)action;

/**UIBarButtonItem (普通和选中状态)
 *image 普通状态图片
 *selectedImage 选中状态图片
 *title 按钮标题 文字颜色高亮下是红色,普通状态是黑色
 *target 方法的拥有者
 *action 点击按钮会调用的方法
 */
+ (nonnull instancetype)barButtonCustomViewWithImage:(nullable UIImage *)image selectedImage:(nullable UIImage *) selectedImage title: (nullable NSString *) title target:(nullable id)target action:(nullable SEL)action;

@end
