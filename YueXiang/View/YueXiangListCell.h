//
//  YueXiangListCell.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VVImageView.h"
@interface YueXiangListCell : UITableViewCell

//* 左侧图片 */
@property(nonatomic,strong)VVImageView *iconIV;
//* 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
//* 长题目标签 */
@property(nonatomic,strong)UILabel *longTitleLb;
//* 点击数标签 */
//* laben for clicks number */
@property(nonatomic,strong)UILabel *clicksNumLb;

@end
