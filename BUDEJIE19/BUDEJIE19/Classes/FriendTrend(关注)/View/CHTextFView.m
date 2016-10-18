//
//  CHTextFView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTextFView.h"

@interface CHTextFView ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNO;
@property (weak, nonatomic) IBOutlet UITextField *pwd;

@end
@implementation CHTextFView

+ (instancetype)textFView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
#pragma mark - 监听 登录按钮点击事件
- (IBAction)loginBtn:(UIButton *)sender {
    NSLog(@"点击登录按钮");
}
#pragma mark - 监听 忘记密码按钮点击事件
- (IBAction)lostPwd:(UIButton *)sender {
    NSLog(@"点击忘记密码按钮");
}
@end
