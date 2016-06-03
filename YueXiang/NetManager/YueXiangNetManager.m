//
//  YueXiangNetManager.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangNetManager.h"

#define kTuWanPath      @"http://cache.tuwan.com/app/"
#define kAppId          @"appid": @1
#define kAppVer         @"appver": @2.1
#define kClassMore      @"classmore": @"indexpic"
#define kTuWanDetailPath     @"http://api.tuwan.com/app/"

//定义成宏，防止哪天服务器人员犯病，突然改动所有dtid键为tuwanID。 我们只需要改变宏中的字符串即可。
#define kRemoveClassMore(dic)        [dic removeObjectForKey:@"classmore"];
#define kSetDtId(string, dic)        [dic setObject:string forKey:@"dtid"];
#define kSetClass(string, dic)       [dic setObject:string forKey:@"class"];
#define kSetMod(string, dic)         [dic setObject:string forKey:@"mod"];

@implementation YueXiangNetManager

+ (id)getYueXiangInfoWithType:(InfoType)type start:(NSInteger)start kCompletionHandle{
    //把所有接口共有的参数放到switch外面
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kAppVer, kAppId, @"start": @(start), kClassMore}];
    //安装SCXcodeSwitchExpander插件，可以自动添加所有case
    switch (type) {
        case InfoTypeTouTiao: {
            break;
        }
        case InfoTypeDuJia: {
            kRemoveClassMore(params)
            kSetMod(@"八卦", params)
            kSetClass(@"heronews", params)
            break;
        }
        case InfoTypeYouXi: {
            kRemoveClassMore(params)
            kSetDtId(@"57067", params)
            break;
        }
        case InfoTypeTuPian:
            [params setObject:@"pic" forKey:@"type"];
            kSetDtId(@"83623,31528,31537,31538,57067,91821", params)
            kRemoveClassMore(params)
            break;
        case InfoTypeLeShi: {
            kSetMod(@"趣闻", params)
            kSetClass(@"heronews", params)
            kSetDtId(@"0", params);
            break;
        }
        case InfoTypeMeiNv: {
            kSetMod(@"美女", params)
            kSetClass(@"heronews", params)
            [params setObject:@"cos1" forKey:@"typechild"];
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    
    //因为兔玩服务器的要求，传入参数不能为中文，需要转化为%号形式
    NSString *path = [self percentPathWithPath:kTuWanPath params:params];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([YueXiangModel mj_objectWithKeyValues:responseObj], error);
    }];
}

//视频页
+ (id)getVideoWithIndex:(NSInteger)index  completionHandle:(void(^)(id model, NSError *error))completionHandle
{
    NSString *path=[NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", (long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([YueXiangVideoModel mj_objectWithKeyValues:responseObj], error);
    }];
}
//视频详情页
+ (id)getVideoDetailWithId:(NSString *)aid kCompletionHandle{
    return [self GET:[self percentPathWithPath:kTuWanDetailPath params:@{kAppId, @"aid": aid}] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。  第二种会数组越界
        completionHandle([YueXiangVideoModel mj_objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}
+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle{
    return [self GET:[self percentPathWithPath:kTuWanDetailPath params:@{kAppId, @"aid": aid}] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。  第二种会数组越界
        completionHandle([YueXiangPicModel mj_objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}
@end
