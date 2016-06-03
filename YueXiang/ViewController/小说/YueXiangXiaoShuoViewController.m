//
//  YueXiangXiaoShuoViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangXiaoShuoViewController.h"

#import "YueXiangXiaoShuoViewModel.h"
#import "YueXiangHtmlViewController.h"
@interface YueXiangXiaoShuoViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webView;
@end

@implementation YueXiangXiaoShuoViewController

+ (UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        YueXiangXiaoShuoViewController *vc = [[YueXiangXiaoShuoViewController alloc] init];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
- (UIWebView *)webView
{
    if (!_webView)
    {
        _webView = [[UIWebView alloc]init];
        _webView.delegate = self;
        NSURL *url=[NSURL URLWithString:@"http://m.ouj.com/box?channel=baike"];
        NSURLRequest *request =[NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小说";
    self.webView.hidden = NO;
    //[self.view setBackgroundColor:[UIColor redColor]];
    
    [_webView  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [Factory  addMenuItemToVC:self];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //YES代表加载网页  NO 代表不加载
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //开始加载网页
//    NSLog(@"webViewDidStartLoad");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //加载网页成功
//    NSLog(@"webViewDidFinishLoad");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    //加载网页失败
//    NSLog(@"didFailLoadWithError:%@", error.userInfo);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
