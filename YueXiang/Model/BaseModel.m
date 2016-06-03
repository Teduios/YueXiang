//
//  BaseModel.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

/** 归档、反归档 */
MJCodingImplementation

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"typeName": @"typename",
             @"ID": @"id",
             @"desc": @"description"};
}

@end
