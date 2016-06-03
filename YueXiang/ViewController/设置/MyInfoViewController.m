//
//  MyInfoViewController.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "MyInfoViewController.h"

#import "VersionViewController.h"
#import "AboutUsViewController.h"
#import "SDImageCache.h"
#import <AFNetworkReachabilityManager.h>
#import "SaoCodeViewController.h"

@interface MyInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIButton *LoginBtn;
@property (strong, nonatomic) UIButton *registBtn;
@property (nonatomic,strong)NSString *path;
@property (nonatomic,strong)UILabel *clearCache;
@property(nonatomic,getter=isOnLine) BOOL onLine;
@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong)UISwitch *mySwitch;
@end

@implementation MyInfoViewController

-(UILabel *)clearCache
{
    if (!_clearCache)
    {
        _clearCache = [UILabel new];
        _clearCache.font = [UIFont systemFontOfSize:14];
    }
    return _clearCache;
}
-(float)filePath
{
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains (NSDocumentDirectory,NSUserDomainMask,YES)firstObject ];
    NSLog(@"%@",cachPath);
    return [self folderSizeAtPath :cachPath];
}
- ( float ) folderSizeAtPath:( NSString *) folderPath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    
    NSString * fileName;
    
    long long folderSize = 0 ;
    
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
        
    }
    //SDWebImage框架自身计算缓存的实现
    folderSize+=[[SDImageCache sharedImageCache] getSize];
    return folderSize/( 1024.0 * 1024.0 );
    
}

//1:首先我们计算一下 单个文件的大小

- ( long long ) fileSizeAtPath:( NSString *) filePath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if ([manager fileExistsAtPath :filePath]){
        
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize ];
        
    }
    
    return 0 ;
    
}
+ (UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MyInfoViewController *vc = [MyInfoViewController new];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
-(void)createAlertView
{
    NSString *str=[NSString stringWithFormat:@"缓存大小为%@.确定要清除缓存？",self.clearCache.text];
//    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message : str delegate : self cancelButtonTitle : @"取消" otherButtonTitles:@"确定" ,nil];
//    [alertView show];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *actionDefault = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self clearFile];
    }];
    [alert addAction:actionCancel];
    [alert addAction:actionDefault];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

-(void)createAlertVieww
{
    NSString *str=[NSString stringWithFormat:@"当前网络为蜂窝网络，谨慎使用"];
//    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message : str delegate:self cancelButtonTitle : @"确定" otherButtonTitles:nil];
//    [alertView show];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:actionCancel];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex==0)
//    {
//        
//    }
//    else
//    {
//        [self clearFile];
//    }
//}

// 清理缓存
- (void)clearFile
{
    
    NSString *cachPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory , NSUserDomainMask,YES).firstObject;
    
    NSArray *files =[[NSFileManager defaultManager]subpathsAtPath :cachPath];
    
    NSLog ( @"cachpath=%@",cachPath);
    
    for ( NSString * p in files) {
        
        NSError * error = nil ;
        
        NSString * path = [cachPath stringByAppendingPathComponent :p];
        
        if ([[ NSFileManager defaultManager ] fileExistsAtPath :path]) {
            [[ NSFileManager defaultManager ] removeItemAtPath :path error :&error];
        }
    }
    [[SDImageCache sharedImageCache]cleanDisk];
    [ self performSelectorOnMainThread : @selector (clearCachSuccess) withObject : nil waitUntilDone : YES ];
    
}
-(void )clearCachSuccess
{
    NSLog (@"清理成功" );
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"缓存清理完毕" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:actionCancel];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
    [_tableView reloadData];//清理完之后重新导入数据
}
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView  alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view  addSubview:_tableView];
        _tableView.scrollEnabled = NO;
        [_tableView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(150, 0, 0, 0));
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [Factory addMenuItemToVC:self];
    //视图上部关于登录的
    _headView = [[UIView alloc]init];
    self.view.backgroundColor = kRGBColor(224,137,246);
    [self.view addSubview:_headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowW,200));
        make.left.mas_equalTo(0);
    }];
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon60"]];
    img.layer.cornerRadius = 30;
    [_headView addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.centerX.mas_equalTo(0);
    }];
    UILabel *label = [[UILabel  alloc]init];
    label.text = @"阅享,值得你拥有!";
    label.textColor = [UIColor  yellowColor];
    [_headView addSubview:label];
    [label  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.left.mas_equalTo(img.mas_left).mas_equalTo(-40);
        make.size.mas_equalTo(CGSizeMake(300, 100));
    }];
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;// 大于号
    if(indexPath.row == 0)
    {
        cell.accessoryType = 1;
        cell.textLabel.text = @"扫一扫";
    }
    else if (indexPath.row == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.text = @"启动网络提醒我";
        self.mySwitch = [[UISwitch  alloc]init];
        [self.mySwitch setOn:NO];
        cell.accessoryView = self.mySwitch;
    }
    else if(indexPath.row == 2)
    {
        cell.accessoryType = 0;
        cell.textLabel.text = @"清除缓存";
        self.clearCache.text = [NSString stringWithFormat:@"%.2fM",[self filePath]];
        [cell.contentView addSubview:self.clearCache];
        [self.clearCache mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(0);
        }];
    }
    else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"版本说明";
    }
    
    else if (indexPath.row == 4)
    {
        cell.textLabel.text = @"关于我们";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [tableView  deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        SaoCodeViewController *code = [[SaoCodeViewController  alloc]init];
        [self.navigationController  pushViewController:code animated:YES];
    }
    else  if (indexPath.row ==1)
    {
        if (!self.mySwitch.on)
        {
            switch (1)
            {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    [self createAlertVieww];
                    self.mySwitch.on = YES;
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    [self createAlertVieww];
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                default:
                    self.onLine = NO;
                    break;
            }
        }
        else
        {
            self.mySwitch.on = NO;
        }
    }
    if (indexPath.row == 2)
    {
        if ([self.clearCache.text isEqualToString:@"0.00M"])
        {
            [self showErrorMsg:@"亲，很干净了!"];
            return;
        }else
            [self createAlertView];
    }
    if (indexPath.row == 3)
    {
        VersionViewController *vc = [[VersionViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 4)
    {
        AboutUsViewController *vc = [[AboutUsViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

@end
