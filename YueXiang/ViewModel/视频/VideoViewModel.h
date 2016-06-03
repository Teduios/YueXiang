//
//  VideoViewModel.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseViewModel.h"

#import "YueXiangNetManager.h"

@interface VideoViewModel : BaseViewModel

@property(nonatomic) NSInteger rowNumber;
@property(nonatomic) NSInteger index;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)descForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;

@end
