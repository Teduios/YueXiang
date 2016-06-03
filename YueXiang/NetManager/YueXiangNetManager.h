//
//  YueXiangNetManager.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseNetManager.h"
#import "YueXiangModel.h"
#import "YueXiangVideoModel.h"
#import "YueXiangPicModel.h"
//只要公用一个解析类的请求，就可以合起来写，只需要使用枚举变量，来决定不同的请求地址即可
//如果不会 可以参考汽车之家接口

typedef NS_ENUM(NSUInteger, InfoType) {
    InfoTypeTouTiao,        //最新
    InfoTypeDuJia,          //独家
    InfoTypeYouXi,          //游戏
    InfoTypeTuPian,
    InfoTypeLeShi,          //趣闻
    InfoTypeMeiNv,          //美女
};

@interface YueXiangNetManager : BaseNetManager


+ (id)getYueXiangInfoWithType:(InfoType)type start:(NSInteger)start kCompletionHandle;

+ (id)getVideoWithIndex:(NSInteger)index  kCompletionHandle;
/**
 *  获取视频类资讯的详情页
 *
 *  @param aid 资讯aid
 *
 *  @return 任务
 */
+ (id)getVideoDetailWithId:(NSString *)aid kCompletionHandle;

/**
 *  获取图片类资讯的详情页
 *
 *  @param aid 资讯aid
 *
 *  @return 任务
 */
+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle

@end
