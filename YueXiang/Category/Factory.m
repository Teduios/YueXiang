//
//  Factory.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "Factory.h"

@implementation Factory

//添加菜单栏按钮
+ (void)addMenuItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"find_news"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"find_news"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}
//添加菜单栏右侧按钮
+ (void)addLoadItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kWindowW-10, 0, 40, 40);
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentRightMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *loadItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    spaceItem.width = 0;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,loadItem];
}
/** 向某个控制器上，添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"web_btn_back"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"web_btn_back"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 45, 44);
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}

@end
