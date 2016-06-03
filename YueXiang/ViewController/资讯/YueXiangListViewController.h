//
//  YueXiangListViewController.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YueXiangListViewController : UITableViewController

/** 接收外部传参，决定当前控制器显示哪种类型的信息 */
@property(nonatomic,strong) NSNumber *infoType;
//+ (UINavigationController *)standardKaKaNavi;

@end
