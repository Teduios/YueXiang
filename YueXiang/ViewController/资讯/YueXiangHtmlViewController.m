//
//  YueXiangHtmlViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangHtmlViewController.h"

@interface YueXiangHtmlViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView *webView;
@end

@implementation YueXiangHtmlViewController

- (id)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.title = @"资讯";
    [Factory addBackItemToVC:self];

}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}

@end
