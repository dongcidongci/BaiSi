 //
//  CHNewViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHNewViewController.h"
#import "CHTagTableViewController.h"

#import "CHAllTopicViewController.h"
#import "CHVideoViewController.h"
#import "CHVoiceViewController.h"
#import "CHPhotoViewController.h"
#import "CHTextViewController.h"

@interface CHNewViewController ()

@end

@implementation CHNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highLightedImage:[UIImage imageNamed:@"MainTagSubIconClick"] title:nil target:self action:@selector(subMenu)];
    //设置TitleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    
}
- (void)subMenu{
    CHTagTableViewController *tagVC = [[CHTagTableViewController alloc]init];
    tagVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tagVC animated:YES];
}
- (void)addChildViewControllers{
    //全部
    //CHMainViewController *mainVc = [[CHMainViewController alloc] init];
    CHAllTopicViewController *allTopicVC = [[CHAllTopicViewController alloc] init];
    allTopicVC.title = @"全部";
    [self addChildViewController:allTopicVC];
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
