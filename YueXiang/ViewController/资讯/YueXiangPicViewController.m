//
//  YueXiangPicViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangPicViewController.h"

#import "YueXiangPicViewModel.h"

@interface YueXiangPicViewController ()<MWPhotoBrowserDelegate>
@property(nonatomic,strong) YueXiangPicViewModel *YueXiangPicVM;
@end

@implementation YueXiangPicViewController

- (YueXiangPicViewModel *)YueXiangPicVM
{
    if (!_YueXiangPicVM) {
        _YueXiangPicVM = [[YueXiangPicViewModel alloc] initWithAid:_aid];
    }
    return _YueXiangPicVM;
}

- (id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}
- (id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAid方法初始化", __func__);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //非xib，storyboard。 默认背景色是透明
    self.view.backgroundColor = [UIColor whiteColor];
    [Factory addBackItemToVC:self];
    //请求时要有正在操作的提示
    [self showProgress];
    [self.YueXiangPicVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        //创建图片展示页面，Github排名最高的图片展示类控件
        MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc] initWithDelegate:self];
        //图片展示页面不应该是当前页推出的，而应该是取代当前页面在导航控制器中的位置。
        NSMutableArray *naviVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        //删除掉最后一个控制器，即当前的白色控制器
        [naviVCs removeLastObject];
        //把图片控制器添加到最后
        [naviVCs addObject:photoB];
        //把新的控制器数组赋值给导航控制器
        self.navigationController.viewControllers = naviVCs;
    }];
}
#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.YueXiangPicVM.rowNumber;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.YueXiangPicVM picURLForRow:index]];
    return photo;
}

@end
