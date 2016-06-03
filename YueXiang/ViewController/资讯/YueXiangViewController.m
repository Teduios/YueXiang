//
//  YueXiangViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangViewController.h"

#import "YueXiangViewModel.h"
#import "YueXiangListViewController.h"

@interface YueXiangViewController ()

@end

@implementation YueXiangViewController

+ (UINavigationController *)standardTuWanNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        YueXiangViewController *vc = [[YueXiangViewController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值, KVC
        //vc setValue:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
/** 提供每个VC对应的values值数组 */
+ (NSMutableArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSMutableArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
//    return @[@"最新",@"独家",@"逆袭",@"图片",@"乐事",@"美女"];
    return @[@"最新",@"独家",@"逆袭",@"图片",@"乐事"];
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[YueXiangListViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"资讯";
    [Factory addMenuItemToVC:self];
    //[Factory addLoadItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
