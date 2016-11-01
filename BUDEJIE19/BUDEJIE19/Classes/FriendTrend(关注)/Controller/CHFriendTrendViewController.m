//
//  CHFriendTrendViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/15.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHFriendTrendViewController.h"
#import "CHLoginViewController.h"
#import "CHSortViewController.h"
@interface CHFriendTrendViewController ()

@end

@implementation CHFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonCustomViewWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highLightedImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] title:nil target:self action:@selector(addFriend)];
}

- (void)addFriend {
    CHSortViewController *sortVc = [[CHSortViewController alloc] init];
    [self.navigationController pushViewController:sortVc animated:YES];
}
//点击立即登录注册
- (IBAction)loginRightNow:(UIButton *)sender {
    CHLoginViewController *loginVC = [[CHLoginViewController alloc] init];
    [self.navigationController presentViewController:loginVC animated:YES completion:nil];
    
}



@end
