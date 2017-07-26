//
//  ViewController.m
//  OCAndJSTest
//
//  Created by DQaemoney on 2017/7/21.
//  Copyright © 2017年 developer@aemoney.com. All rights reserved.
//

#import "ViewController.h"
#import "URLInterceptVc.h"
#import "MessageHandlerVc.h"
#import "JavaScriptCoreVc.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)pushToURLInterceptVc:(UIButton *)sender {
    
    URLInterceptVc *interceptVc = [[URLInterceptVc alloc]init];
    [self.navigationController pushViewController:interceptVc animated:YES];
}

- (IBAction)pushToHandlerVc:(id)sender {
    
    MessageHandlerVc *messageHandleVc = [[MessageHandlerVc alloc]init];
    [self.navigationController pushViewController:messageHandleVc animated:YES];
}

- (IBAction)pushToScriptCoreVc:(id)sender {
    
    JavaScriptCoreVc *coreVc = [[JavaScriptCoreVc alloc]init];
    [self.navigationController pushViewController:coreVc animated:YES];
}

@end
