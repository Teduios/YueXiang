//
//  VersionViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "VersionViewController.h"

@interface VersionViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;
}
@end

@implementation VersionViewController

- (UIWebView *)webView
{
    
    if (!_webView)
    {
        _webView = [[UIWebView alloc]init];
        
        NSString *txtPath=[[NSBundle mainBundle]pathForResource:@"about" ofType:@"txt"];
        NSString *string=[[NSString alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
        [_webView loadHTMLString:string baseURL:nil];
        [self.view addSubview:_webView];
        _webView.scrollView.showsVerticalScrollIndicator=NO;
        
        _webView.delegate=self;
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"版本说明";
    
    self.webView.scrollView.scrollEnabled = YES;
    
    [_webView  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(0);
    }];
    [Factory  addBackItemToVC:self];
    
}

@end
