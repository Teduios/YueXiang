//
//  LeftViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "LeftViewController.h"

#import <NSString+Icons.h>
#import "YueXiangViewController.h"
#import "YueXiangPicViewController.h"
#import "VideoViewController.h"
#import "MyInfoViewController.h"
#import "YueXiangXiaoShuoViewController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *itemNames;

@end

@implementation LeftViewController

//+ (UINavigationController *)standardVC
//{
//    static dispatch_once_t onceToken;
//    static UINavigationController *navi = nil;
//    dispatch_once(&onceToken, ^{
//      LeftViewController  *vc = [[LeftViewController alloc]init];
//      navi = [[UINavigationController  alloc]initWithRootViewController:vc];
//    });
//    return navi;
//}

- (NSArray *)itemNames{
    return @[@"资讯", @"视频", @"畅游",@"设置"];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView=[UIView new];
        // 删除Cell的分割线
        // _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
    }
    return _tableView;
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}
/** 去掉分割线左侧缝隙 */
kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[YueXiangViewController standardTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[VideoViewController standardTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
            [self.sideMenuViewController setContentViewController:[YueXiangXiaoShuoViewController standardTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 3:
            [self.sideMenuViewController setContentViewController:[MyInfoViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //必须触发一下tableView的懒加载才可以
    [self.tableView reloadData];
    UIView *view = [[UIView  alloc]init];
    //view.backgroundColor = [UIColor  redColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(250, 100));
        make.top.mas_equalTo(10);
    }];
    UIImageView *img = [[UIImageView  alloc]initWithImage:[UIImage imageNamed:@"icon60"]];
    img.layer.cornerRadius = 30;
    [view  addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(10);
         make.size.mas_equalTo(CGSizeMake(60, 60));
         make.bottom.mas_equalTo(self.tableView.mas_top).mas_equalTo(-5);
     }];
    UILabel *tf = [[UILabel  alloc]init];
    tf.text = @"阅享! 让您畅享每一天!";
    tf.font = [UIFont systemFontOfSize:17];
    tf.numberOfLines = 1;
    tf.textColor = [UIColor  redColor];
    [view addSubview:tf];
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(img.mas_top).mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(220, 20));
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
