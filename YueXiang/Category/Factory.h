//
//  Factory.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject

/** 向某个控制器上，添加菜单按钮 */
+ (void)addMenuItemToVC:(UIViewController *)vc;

/** 向某个控制器上，添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc;

+ (void)addLoadItemToVC:(UIViewController *)vc;

@end
