//
//  YueXiangImageCell.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VVImageView.h"

@interface YueXiangImageCell : UITableViewCell

/** 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
/** 点击数标签 */
@property(nonatomic,strong)UILabel *clicksNumLb;
/** 图片1 */
@property(nonatomic,strong)VVImageView *iconIV0;
/** 图片2 */
@property(nonatomic,strong)VVImageView *iconIV1;
/** 图片3 */
@property(nonatomic,strong)VVImageView *iconIV2;

@end
