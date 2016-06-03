//
//  YueXiangXiaoShuoNetManager.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangXiaoShuoNetManager.h"

#define kToolMenuPath       @"http://box.dwstatic.com/apiToolMenu.php"
#define kOSType     @"OSType": [@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion] //获取当前系统版本号

#define kVersionName    @"versionName": @"2.4.0"
#define kV              @"v": @140

@implementation YueXiangXiaoShuoNetManager

+ (id)getToolMenuCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kToolMenuPath parameters:@{kV, kVersionName, kOSType, @"category": @"database"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([YueXiangXiaoShuoModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

@end
