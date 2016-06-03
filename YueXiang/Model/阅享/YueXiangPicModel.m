//
//  YueXiangPicModel.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangPicModel.h"

@implementation YueXiangPicModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"showitem" : [YueXiangPicShowitemModel class], @"relevant" : [YueXiangPicRelevantModel class], @"content" : [YueXiangPicContentModel class]};
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"typeName":@"typename"};
}

@end

@implementation YueXiangPicInfochildModel

@end

@implementation YueXiangPicShowitemModel

@end

@implementation YueXiangPicShowitemInfoModel

@end

@implementation YueXiangPicRelevantModel

@end

@implementation YueXiangPicContentModel

@end

@implementation YueXiangPicContentInfoModel

@end
