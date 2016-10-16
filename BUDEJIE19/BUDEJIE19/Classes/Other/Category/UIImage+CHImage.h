//
//  UIImage+CHImage.h
//  lost02
//
//  Created by moxuyou on 16/9/20.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHImage)
/**返回一张没有渲染的原始图片*/
+ (UIImage *)imageWithOriginalMode:(NSString *)imageName;
/**用一个颜色生成一张图片*/
+ (UIImage *)imageWithColor:(UIColor *)color;
/**返回一张可无限拉伸不失真的图片*/
+ (UIImage *)imageCappedWithOriginalImage:(UIImage *)image;
@end
