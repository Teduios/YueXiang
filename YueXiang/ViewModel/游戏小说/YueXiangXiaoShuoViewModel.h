//
//  YueXiangXiaoShuoViewModel.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseViewModel.h"

#import "YueXiangXiaoShuoNetManager.h"
/** 此处为type定义枚举类型，有web和native 2值 */
typedef NS_ENUM(NSUInteger, ToolMenuItemType) {
    ToolMenuItemTypeNative,
    ToolMenuItemTypeWeb,
};

@interface YueXiangXiaoShuoViewModel : BaseViewModel

/** 有多少行 */
@property(nonatomic) NSInteger rowNumber;
/** 某行的图标URL */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 某行的题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 某行的数据类型--枚举类型 */
- (ToolMenuItemType)itemTypeForRow:(NSInteger)row;
/** 某行的tag值 */
- (NSString *)tagForRow:(NSInteger)row;
/** 网页类型的链接地址 */
- (NSURL *)webURLForRow:(NSInteger)row;

@end
