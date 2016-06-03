//
//  YueXiangViewController.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import <WMPageController/WMPageController.h>
#import <WMPageController.h>

@interface YueXiangViewController : WMPageController

//内容页的首页应该是单例的，每次进程都只初始化一次
+ (UINavigationController *)standardTuWanNavi;

@end
