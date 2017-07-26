//
//  JavaScriptCoreVc.m
//  OCAndJSTest
//
//  Created by DQaemoney on 2017/7/21.
//  Copyright © 2017年 developer@aemoney.com. All rights reserved.
//

#import "JavaScriptCoreVc.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface JavaScriptCoreVc ()

@property (nonatomic, strong) UIWebView *webView;
@end

@implementation JavaScriptCoreVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIWebView-JavaScriptCore";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate = self;
    NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
    //    NSURL *htmlURL = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    
    self.webView.backgroundColor = [UIColor clearColor];
    // UIWebView 滚动的比较慢，这里设置为正常速度
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //定义好JS要调用的方法, share就是调用的share方法名
    context[@"share"] = ^() {
        NSArray *args = [JSContext currentArguments];
        NSLog(@"传递的参数是:%@",args);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"方式二" message:@"这是OC原生的弹出窗" delegate:self cancelButtonTitle:@"收到" otherButtonTitles:nil];
            [alertView show];
        });
        
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal.toString);
        }
        
        NSLog(@"-------End Log-------");
    };
    
}

@end
