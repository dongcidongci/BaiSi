//
//  CHBackView.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/20.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHBackView : UIView
/**导航条左边返回按钮*/
+ (instancetype)backViewWithImage:(nullable UIImage *)image highLImage:(nullable UIImage *)highLImage title:(nullable NSString *)title target:(nonnull id)target action:(nonnull SEL)action;
@end
