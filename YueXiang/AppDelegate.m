//
//  AppDelegate.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "AppDelegate.h"

#import "AppDelegate+System.h"
#import "LeftViewController.h"
#import "YueXiangViewController.h"
#import "WelcomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeWithApplication:application];
    
    NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
    /*
     版本号:
     version:正式发布版本号，用户只能看到version
     build:测试版本号，是对于程序员来说的
     */
    //    NSLog(@"infoDic %@", infoDic);
    NSString *key =@"CFBundleShortVersionString";
    NSString *currentVersion = infoDic[key];
    //已运行过的版本号需要持久化处理，通常存储在userDefault中
    NSString *runVersion=[[NSUserDefaults standardUserDefaults] stringForKey:key];
    if (runVersion==nil || ![runVersion isEqualToString:currentVersion] ) {
        //没运行过 或者 版本号不一致，则显示欢迎页
        WelcomeViewController *welcome = [WelcomeViewController new];
        self.window.rootViewController = welcome;
        //保存新的版本号,防止下次运行再显示欢迎页
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
    }else{
        //显示主界面
        self.window.rootViewController = self.sideMenu;
    }
    [self configGlobalUIStyle]; //配置全局UI样式
    return YES;
}
/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize], NSForegroundColorAttributeName: kNaviTitleColor}];
}

/** 代码重构:用代码把功能实现以后，考虑代码结构如何编写可以更加方便后期维护 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[YueXiangViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图,图片插件KSImageName，到Github下载
        _sideMenu.backgroundImage =[UIImage imageNamed:@"leftImage"];
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}

@end
