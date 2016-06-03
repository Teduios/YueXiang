//
//  YueXiangModel.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangModel.h"

@implementation YueXiangModel

@end

@implementation YueXiangDataModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"indexpic" : [YueXiangDataIndexpicModel class], @"list" : [YueXiangDataIndexpicModel class]};
}

@end

@implementation YueXiangDataIndexpicModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"showitem" : [YueXiangDataIndexpicShowitemModel class]};
}

@end

@implementation YueXiangDataIndexpicInfochildModel

@end

@implementation YueXiangDataIndexpicShowitemModel

@end

@implementation YueXiangDataIndexpicShowitemInfoModel

@end
