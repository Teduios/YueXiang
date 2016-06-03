//
//  YueXiangPicViewController.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YueXiangPicViewController : UIViewController

/** 此界面内容要根据aid来决定，所以aid是必须的 */
- (id _Nonnull)initWithAid:(NSString * _Nonnull )aid;
@property(nonatomic,strong) NSString * _Nonnull aid;

@end
