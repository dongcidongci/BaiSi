//
//  CHWebController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/22.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHWebController.h"
#import <WebKit/WebKit.h>
@interface CHWebController ()
@property (weak, nonatomic) IBOutlet UIView *webViewBGView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
/**网页控件 */
@property(weak, nonatomic) WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBtnItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardBtnItem;

@end

@implementation CHWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加WKWebView
    WKWebView *webView = [[WKWebView alloc] init];
    webView.frame = CGRectMake(0, 0, CHSCREENW, CHSCREENH);
    [webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    [self.webViewBGView addSubview:webView];
    self.webView = webView;
    //添加监听(这个控件的属性值,苹果建议使用KVO进行监听)
    [self addObserver];
    /*KVO的三部曲
     > 添加监听者
     > 实现监听方法
     > 移除监听者
     
     */



}
#pragma mark - 添加监听者
- (void)addObserver{
    [self.webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];//estimatedProgress
}
#pragma mark -当监听到属性值改变的时候调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    self.backBtnItem.enabled = self.webView.canGoBack;
    self.forwardBtnItem.enabled = self.webView.canGoForward;
    self.progressView.progress = self.webView.estimatedProgress;
    if (self.webView.estimatedProgress > 1) {
        self.progressView.hidden = YES;
    }
    
}
#pragma mark - 移除监听
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
#pragma mark - 刷新数据
- (IBAction)refreshClick:(UIBarButtonItem *)sender {
    [self.webView reload];
}
#pragma mark - 下一页按钮
- (IBAction)forwardClick:(UIBarButtonItem *)sender {
    [self.webView goForward];
}
#pragma mark -返回按钮
- (IBAction)backClick:(UIBarButtonItem *)sender {
    [self.webView goBack];
}


@end
