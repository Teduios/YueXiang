//
//  SaoCodeViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "SaoCodeViewController.h"

@implementation SaoCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imgView = [[UIImageView  alloc]init];
    [self.view addSubview:imgView];
    [imgView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [@"http://www.baidu.com" dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *outputImage = [filter outputImage];
    UIImage *qrImage = [UIImage imageWithCIImage:outputImage];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0.0);
    [qrImage drawInRect:CGRectMake(0, 0, 200, 200)];
    UIImage *headerImage = [UIImage imageNamed:@"icon60"];
    [headerImage drawInRect:CGRectMake(80, 80, 40, 40)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imgView.image = newImage;
}

@end
