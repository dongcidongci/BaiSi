//
//  UIBarButtonItem+CHBarButtonItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CHBarButtonItem)

/**获取UIBarButtonItem (设置图片/文字/监听方法/文字的颜色高亮为红色,默认为黑色)*/
+ (nullable UIBarButtonItem *)barButtonCustomViewWithImage:(nullable UIImage *)image highLightedImage:(nullable UIImage *) highLightedImage title:(nullable NSString *) title target:(nullable id)target action:(nullable SEL)action;


@end
