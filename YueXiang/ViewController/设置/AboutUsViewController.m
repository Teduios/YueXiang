//
//  AboutUsViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation AboutUsViewController

- (UIWebView *)webView
{
    if (!_webView)
    {
        _webView = [[UIWebView alloc]init];
        _webView.delegate = self;
        NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
        NSURLRequest *request =[NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    self.webView.hidden = NO;
    
    [_webView  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [Factory  addBackItemToVC:self];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //YES代表加载网页  NO 代表不加载
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //开始加载网页
    NSLog(@"webViewDidStartLoad");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //加载网页成功
    NSLog(@"webViewDidFinishLoad");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    //加载网页失败
    NSLog(@"didFailLoadWithError:%@", error.userInfo);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
