//
//  URLInterceptVc.m
//  OCAndJSTest
//
//  Created by DQaemoney on 2017/7/21.
//  Copyright © 2017年 developer@aemoney.com. All rights reserved.
//

#import "URLInterceptVc.h"

@interface URLInterceptVc ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@end

@implementation URLInterceptVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIWebView拦截URL";
    self.view.backgroundColor = [UIColor whiteColor];
   
    // 创建webView实例以及请求
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate = self;
    NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:@"demo.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    
    // 如果不想要webView 的回弹效果,发送请求
    self.webView.scrollView.bounces = NO;
    // UIWebView 滚动的比较慢，这里设置为正常速度
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

#pragma mark -- WebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request.URL);
    return YES;
}

@end
