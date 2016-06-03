//
//  YueXiangVideoModel.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangVideoModel.h"

@implementation YueXiangVideoModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"videoSidList" : [YueXiangVideosidlistModel class], @"videoList" : [YueXiangVideolistModel class]};
}
@end
@implementation YueXiangVideosidlistModel

@end

@implementation YueXiangVideolistModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"desc": @"description",
             @"m3u8Url": @"m3u8_url",
             @"m3u8HdUrl":@"m3u8Hd_url",
             @"mp4Url":@"mp4_url",
             @"mp4HdUrl":@"mp4Hd_url"
             };
}

@end
