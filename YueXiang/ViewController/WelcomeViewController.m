//
//  WelcomeViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "WelcomeViewController.h"

#import "UIView+Extension.h"
#import "LeftViewController.h"
#import "YueXiangViewController.h"
#define IMAGECOUNT 3

@interface WelcomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.创建滚动视图实例
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    // 设置滚动视图的代理
    scrollView.delegate = self;
    scrollView.frame = self.view.bounds;
    
    //2.添加滚动视图到self.view中
    [self.view addSubview:scrollView];
    
    //3.配置滚动视图
    //配置边缘不可以弹跳
    scrollView.bounces = NO;
    
    //设置整页滚动
    scrollView.pagingEnabled = YES;
    
    //设置水平滚动条不可见
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.contentSize = CGSizeMake(IMAGECOUNT*scrollView.width, 0);
    
    for (NSInteger i=0; i<IMAGECOUNT; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        
        CGSize size = [[UIScreen mainScreen] currentMode].size;
        BOOL isIp6 =CGSizeEqualToSize(size, CGSizeMake(750, 1334));
        NSString *imageName = nil;
        if (isIp6) {
            imageName = [NSString stringWithFormat:@"welcome%ld",i+1];
        }else{
            imageName = [NSString stringWithFormat:@"welcome%ld",i+1];
        }
        
        imageView.image = [UIImage imageNamed:imageName];
        //imageView.frame = CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        imageView.size = scrollView.size;
        imageView.x = i*scrollView.width;
        
        
        [scrollView addSubview:imageView];
        
        //针对最后一个图片视图添加“进入应用”按钮
        if (i==(IMAGECOUNT-1)) {
            [self setupEnterButton:imageView];
        }
        
    }
    
    /* 配置UIPageControl */
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    //pageControl.frame = CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 40);
    pageControl.width = self.view.width;
    pageControl.height = 40;
    pageControl.y = self.view.height-60;
    
    //设置圆点没有选中时的颜色
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    //设置圆点选中时的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    //设置一共有几个圆点
    pageControl.numberOfPages = IMAGECOUNT;
    //禁止与用户交互（用户点击后无响应）
    pageControl.userInteractionEnabled = NO;
    
    //将分页控件添加到self.view中
    [self.view addSubview:pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    // 取 滚动的横向距离 与屏幕宽度的整数倍
    double i = offset.x/scrollView.frame.size.width;
    
    // 将这个整数倍作为被选中的小圆点的下标
    self.pageControl.currentPage = round(i);
}

//配置最后一页的 进入应用  按钮
-(void)setupEnterButton:(UIImageView *)imageView
{
    //预备：开始图片的用户交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.创建按钮
    UIButton *enterButton = [[UIButton alloc]init];
    
    enterButton.width = 150;
    enterButton.height = 40;
    enterButton.x = (imageView.width-150)/2;
    enterButton.y = imageView.height*0.8;
    enterButton.backgroundColor = [UIColor colorWithRed:216/255.0 green:57/255.0 blue:48/255.0 alpha:1.0];
    [enterButton setTitle:@"立即体验" forState:UIControlStateNormal];
    enterButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [enterButton addTarget:self action:@selector(enterApp) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:enterButton];
    
}

-(void)enterApp
{
    self.window.rootViewController = self.sideMenu;
    [self configGlobalUIStyle]; //配置全局UI样式
}
/***/

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
