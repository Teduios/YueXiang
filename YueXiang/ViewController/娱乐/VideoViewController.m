//
//  VideoViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "VideoViewController.h"

#import "VideoViewModel.h"
#import "VideoCell.h"
#import "Factory.h"

@interface VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) VideoViewModel *videoVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation VideoViewController

+ (UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        VideoViewController *vc = [[VideoViewController alloc] init];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 52;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
- (VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM=[VideoViewModel new];
    }
    return _videoVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    [Factory addMenuItemToVC:self];
    self.tableView.hidden = NO;
    
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error)
         {
             [_tableView.mj_header endRefreshing];
             [_tableView reloadData];
         }];
    }];
    [_tableView.mj_header beginRefreshing];
    
    _tableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM   getMoreDataCompletionHandle:^(NSError *error) {
            
            [_tableView.mj_footer endRefreshing];
            [_tableView reloadData];
        }];
    }];
}
#pragma mark - UITableView 注意是Group形式,以section区分
//设置section头部高度1像素， 高度最小是1
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
//设置secion脚部高度9像素
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
//row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 720 * 540
    CGFloat height= kWindowW * 540.0 / 720;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.titleLb.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLb.text  = [self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"cell_bg"]];
    cell.videoURL=[self.videoVM videoURLForRow:indexPath.section];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
