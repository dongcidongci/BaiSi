//
//  CHLoginViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHLoginViewController.h"
#import "CHLoginView.h"

@interface CHLoginViewController ()<CHLoginViewDelegate>

@end

@implementation CHLoginViewController
- (void)loadView{
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    CHLoginView *loginView = [CHLoginView loginView];
    loginView.delegate = self;
    loginView.frame = self.view.frame;
    [self.view addSubview:loginView];
}
#pragma mark - CHLoginViewDelegate
- (void)loginViewDidClosed:(CHLoginView *)loginView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
