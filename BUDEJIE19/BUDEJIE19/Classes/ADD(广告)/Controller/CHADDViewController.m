//
//  CHADDViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/18.
//  Copyright © 2016年 moxuyou. All rights reserved.
//



#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

#import "CHADDViewController.h"
#import <AFNetworking.h>
#import "AFHTTPSessionManager+CHHTTPSessionManager.h"
#import <MJExtension/MJExtension.h>
#import "CHADDItem.h"
#import <UIImageView+WebCache.h>
#import "CHTabBarController.h"

@interface CHADDViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *laungchImageV;
@property (weak, nonatomic) IBOutlet UIView *contentView;
/**广告数据*/
@property (nonatomic, strong)CHADDItem *addItem;
@property (weak, nonatomic) IBOutlet UIButton *turnToBtn;
/**定时器 */
@property(weak, nonatomic) NSTimer *timer;

@end

@implementation CHADDViewController
/*
 http://mobads.baidu.com/cpro/ui/mads.php?code2
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    //屏幕适配图片
    [self choosePicture];
    //设置广告图片
    [self addPicture];
   self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timing) userInfo:nil repeats:YES];
}
- (void)timing{
    //NSLog(@"%s", __func__);
    static NSInteger count = 3;
    count--;
    [self.turnToBtn setTitle:[NSString stringWithFormat:@"跳转(%ld)", count] forState:UIControlStateNormal];
    if (count == -1) {
        [self turnToMainVC:nil];
    }
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
    //AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager CHManager];
    //拼接参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"code2"] = code2;
    //发送请求
    //由于服务器返回的响应头信息有误,导致AFN无法正常解析数据,解决办法
    
    [manager GET:CHBaseUrl parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //NSLog(@"成功%@", responseObject);
        //[responseObject writeToFile:@"/Users/moxuyou/Desktop/add.plist" atomically:YES];
       NSDictionary *dict =  [responseObject[@"ad"] lastObject];
        //字典转模型
        CHADDItem *addItem = [CHADDItem mj_objectWithKeyValues:dict];
        self.addItem = addItem;
        if (addItem.w > 0) {
            CGFloat h = CHSCREENW / addItem.w *addItem.h;
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.userInteractionEnabled = YES;
            imageView.frame = CGRectMake(0, 0, CHSCREENW, h);
            [imageView sd_setImageWithURL:[NSURL URLWithString:addItem.w_picurl]];
            [imageView addGestureRecognizer:[self addGesture]];
            [self.contentView addSubview:imageView];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误%@", error);
        
    }];
    
}
//创建手势
- (UIGestureRecognizer *)addGesture{
    
    UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnPage)];
    return pan;
    
}
//跳转到广告的来源网页
- (void)turnPage{
    NSURL *url = [NSURL URLWithString:self.addItem.ori_curl];
    //做容错处理
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [[UIApplication sharedApplication] openURL:url];
    }
}

#pragma mark - 监听 跳转按钮的点击
- (IBAction)turnToMainVC:(UIButton *)sender {
    CHTabBarController *tabVC = [[CHTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabVC;
    [self.timer invalidate];
    self.timer = nil;
    
}


@end
