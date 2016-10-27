//
//  CHLoginView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHLoginView.h"
#import "CHTextFView.h"
#import "CHRegistView.h"

@interface CHLoginView ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@end
@implementation CHLoginView

+ (instancetype)loginView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (void)awakeFromNib{
    //设置滚动区域
    self.scrollerView.contentSize = CGSizeMake(self.scrollerView.width, self.scrollerView.height);
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    self.scrollerView.pagingEnabled = YES;
    
    CHTextFView *textFView = [CHTextFView textFView];
    //textFView.frame = self.scrollerView.bounds;
    textFView.frame = CGRectMake(0, 0, self.scrollerView.width, self.scrollerView.height);
    [self.scrollerView addSubview:textFView];
    CHRegistView *textFView2 = [CHRegistView registView];
    textFView2.frame = self.scrollerView.bounds;
    textFView2.x = [UIScreen mainScreen].bounds.size.width;
    [self.scrollerView addSubview:textFView2];
}
#pragma mark- 注册按钮
- (IBAction)registBtn:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"注册账号"]) {
        [sender setTitle:@"已有账号?" forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            
            self.scrollerView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
        }];
    }else if ([sender.titleLabel.text isEqualToString:@"已有账号?"]){
        
        [sender setTitle:@"注册账号" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            
            self.scrollerView.contentOffset = CGPointMake(0, 0);
        }];
    }
}

#pragma mark- 取消登录
- (IBAction)cancelBtn:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(loginViewDidClosed:)]) {
        [self.delegate loginViewDidClosed:self];
    }
}
#pragma mark- 快速登录通道
- (IBAction)loginInInstanceWay:(UIButton *)sender {
    if (sender.tag == 0) {
        NSLog(@"点击了qq快速登录按钮");
    }else if (sender.tag == 1){
         NSLog(@"点击了微博快速登录按钮");
        
    }else if (sender.tag == 2){
         NSLog(@"点击了腾讯微博快速登录按钮");
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
@end
