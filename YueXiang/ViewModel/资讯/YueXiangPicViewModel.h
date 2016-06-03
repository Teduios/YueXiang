//
//  YueXiangPicViewModel.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseViewModel.h"

#import "YueXiangNetManager.h"

@interface YueXiangPicViewModel : BaseViewModel

- (id)initWithAid:(NSString *)aid;
/** aid的赋值应该是非空,使用xcode7新加入的非空标识 */
@property(nonatomic,strong) NSString * aid;

@property(nonatomic) NSInteger rowNumber;
- (NSURL *)picURLForRow:(NSInteger)row;
@property(nonatomic,strong) YueXiangPicModel *picModel;

@end
