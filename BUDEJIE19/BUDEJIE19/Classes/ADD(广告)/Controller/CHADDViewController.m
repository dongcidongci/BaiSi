//
//  CHADDViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/18.
//  Copyright © 2016年 moxuyou. All rights reserved.
//


#define iPhone6P CHSCREENH == 736
#define iPhone6 CHSCREENH == 667
#define iPhone5 CHSCREENH == 568
#define iPhone4 CHSCREENH == 480

#import "CHADDViewController.h"
#import <AFNetworking.h>

@interface CHADDViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *laungchImageV;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CHADDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //屏幕适配图片
    [self choosePicture];
}
#pragma mark - 选择合适的图片展示在广告界面
- (void)choosePicture{
    if (iPhone6P) {
        self.laungchImageV.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if (iPhone6){
        self.laungchImageV.image = [UIImage imageNamed:@"LaunchImage-800-667h@2x"];
    }else if (iPhone5){
        self.laungchImageV.image = [UIImage imageNamed:@"LaunchImage-700-568h@2x"];
    }else if (iPhone4){
        self.laungchImageV.image = [UIImage imageNamed:@"LaunchImage-700@2x"];
    }
   
}
#pragma mark -设置广告图片
- (void)addPicture{
    //创建网络请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //拼接参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    //发送请求
    [manager GET:@"" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

#pragma mark - 监听 跳转按钮的点击
- (IBAction)turnToMainVC:(UIButton *)sender {
    NSLog(@"%s", __func__);
}


@end
