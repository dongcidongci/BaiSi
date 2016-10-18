//
//  CHRegistView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHRegistView.h"

@interface CHRegistView ()
@property (weak, nonatomic) IBOutlet UITextField *inputPhoneNO;
@property (weak, nonatomic) IBOutlet UITextField *settingPswTF;

@end
@implementation CHRegistView
+ (instancetype)registView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (void)awakeFromNib{
    //设置背景图片
    NSString *path = [[NSBundle mainBundle] pathForResource:@"login_rgister_textfield_bg.png" ofType:nil];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    self.inputView.backgroundColor = [UIColor colorWithPatternImage:image];
}
#pragma mark - 监听 注册按钮的点击事件
- (IBAction)registBtnClick:(UIButton *)sender {
}


@end
