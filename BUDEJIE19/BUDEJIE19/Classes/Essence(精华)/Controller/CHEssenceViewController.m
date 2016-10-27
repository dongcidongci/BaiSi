//
//  CHEssenceViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHEssenceViewController.h"
#import "CHRecomandViewController.h"

#import "CHMainViewController.h"
#import "CHVideoViewController.h"
#import "CHVoiceViewController.h"
#import "CHPhotoViewController.h"
#import "CHTextViewController.h"



@interface CHEssenceViewController ()

@end

@implementation CHEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self addChildViewControllers];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    //添加导航条左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highLightedImage:[UIImage imageNamed:@"MainTagSubIconClick"] title:nil target:self action:@selector(suMenu)];
    //添加导航条右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highLightedImage:[UIImage imageNamed:@"navigationButtonRandomClick"] title:nil target:nil action:nil];
    //设置TitleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    

    
}

- (void)suMenu{
    CHRecomandViewController *recomandVC = [[CHRecomandViewController alloc] init];
    [self.navigationController pushViewController:recomandVC animated:YES];
}

- (void)addChildViewControllers{
    //全部
    CHMainViewController *mainVc = [[CHMainViewController alloc] init];
    mainVc.title = @"全部";
    [self addChildViewController:mainVc];
    //视频
    CHVideoViewController *videoVc = [[CHVideoViewController alloc] init];
    videoVc.title = @"视频";
    [self addChildViewController:videoVc];
    //声音
    CHVoiceViewController *voiceVc = [[CHVoiceViewController alloc] init];
    voiceVc.title = @"声音";
    [self addChildViewController:voiceVc];
    //图片
    CHPhotoViewController *photoVc = [[CHPhotoViewController alloc] init];
    photoVc.title = @"图片";
    [self addChildViewController:photoVc];
    //文字
    CHTextViewController *textVc = [[CHTextViewController alloc] init];
    textVc.title = @"段子";
    [self addChildViewController:textVc];
    

    
}

@end
