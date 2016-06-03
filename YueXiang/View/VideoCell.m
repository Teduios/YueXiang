//
//  VideoCell.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "VideoCell.h"

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation VideoCell

//为了保证同一时间只有一个播放器，使用单例模式
+ (AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:20];
    }
    return _titleLb;
}
- (UILabel *)descLb
{
    if (!_descLb)
    {
        _descLb = [[UILabel  alloc]init];
        _descLb.font = [UIFont  systemFontOfSize:15];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.numberOfLines = 1;
    }
    return _descLb;
}
- (UIButton *)iconBtn
{
    if (!_iconBtn)
    {
        _iconBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
        [_iconBtn bk_addEventHandler:^(id sender) {
            AVPlayer *player=[AVPlayer playerWithURL:self.videoURL];
            [player play];
            [VideoCell sharedInstance].player = player;
            [sender addSubview:[VideoCell sharedInstance].view];
            [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconBtn;
}

//如果cell被复用了，需要把cell上的播放器删掉
- (void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有则删除-->自己想办法
    if ([VideoCell sharedInstance].view.superview == self.iconBtn) {
        [[VideoCell sharedInstance].view removeFromSuperview];
        [VideoCell sharedInstance].player = nil;
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.descLb];
        [self.contentView addSubview:self.iconBtn];
        
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(20);
        }];
        
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.right.mas_equalTo(-10);
        }];
        
        [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW-20,kWindowW*380/680.0));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_descLb.mas_bottom).mas_equalTo(5);
        }];
    }
    return self;
}

@end
