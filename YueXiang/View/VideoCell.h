//
//  VideoCell.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLb;
@property (strong, nonatomic) UILabel *descLb;
@property (strong, nonatomic) UIButton *iconBtn;

@property(nonatomic,strong) NSURL *videoURL;

@end
