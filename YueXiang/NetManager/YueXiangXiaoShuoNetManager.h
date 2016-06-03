//
//  YueXiangXiaoShuoNetManager.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseNetManager.h"

/** 在多玩Model层中专门创建的头文件，目的只有一个，方便其他类引入多玩的全部头文件 */
#import "YueXiangXiaoShuoModel.h"

@interface YueXiangXiaoShuoNetManager : BaseNetManager

/** 获取游戏百科列表 */
+ (id)getToolMenuCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
