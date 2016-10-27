//
//  CHDrawView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHDrawView.h"

@interface CHDrawView ()
/**<#注释#> */
@property(weak, nonatomic) UILabel *progressLabel;
@end


@implementation CHDrawView

- (UILabel *)progressLabel{
    if (_progressLabel == nil) {
        UILabel *label = [[UILabel alloc]init];
        label.size = CGSizeMake(self.width * 0.5, self.height * 0.5);
        label.center = CGPointMake(self.width * 0.5, self.height * 0.5);
        label.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:label];
        _progressLabel = label;
    }
    return _progressLabel;
}
- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    self.progressLabel.text = [NSString stringWithFormat:@"%.0lf%%",progress * 100];
    [self setNeedsDisplay];
}
//想要通过绘图的方式展示内容在view上面,必须重写drawRect:方法
//什么时候调用:在View显示时调用,通过[self setNeedsDisplay];也可以调用
- (void)drawRect:(CGRect)rect {

    [self drawProgressView];
}
/**画进度条*/
- (void)drawProgressView{
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //圆心的位置
    CGPoint center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    //扇形的圆形半径
    CGFloat radius = self.frame.size.width * 0.5 - 2;
    CGFloat startAngle = - M_PI_2;
    //这个结束角度是关键
    CGFloat endAngle = startAngle + self.progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor colorWithWhite:0 alpha:0.3] set];
    [path fill];
    
    //扇形的圆形半径
    CGFloat radius1 = self.frame.size.width * 0.5 - 7;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius1 startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path1 addLineToPoint:center];
    [[UIColor colorWithWhite:1 alpha:1] set];
    [path1 fill];

    
}













@end
