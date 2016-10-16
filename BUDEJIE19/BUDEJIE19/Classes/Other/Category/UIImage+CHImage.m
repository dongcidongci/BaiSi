//
//  UIImage+CHImage.m
//  lost02
//
//  Created by moxuyou on 16/9/20.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "UIImage+CHImage.h"

@implementation UIImage (CHImage)
+(UIImage *)imageWithOriginalMode:(NSString *)imageName{
    
        UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
    
}
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)imageCappedWithOriginalImage:(UIImage *)image{
    NSInteger capLeft = image.size.width * 0.5 - 1;
    NSInteger capRight = image.size.width * 0.5;
    NSInteger capBottom = image.size.height * 0.5 - 1;
    NSInteger capTop = image.size.height * 0.5;
   UIEdgeInsets inset = image.capInsets;
   inset = UIEdgeInsetsMake(capTop, capLeft, capBottom, capRight);
   UIImage *imageCap = [image resizableImageWithCapInsets:inset];
    return imageCap;
}


@end
