//
//  Constants.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/** 导航栏题目文字大小 */
#define kNaviTitleFontSize   24.0
/** 导航栏题目文字颜色 */
#define kNaviTitleColor     [UIColor colorWithRed:239/255.0 green:141/255.0 blue:119/255.0 alpha:1.0]

//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#define kAppDelegate ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define kStoryboard(StoryboardName)     [UIStoryboard storyboardWithName:StoryboardName bundle:nil]

//通过Storyboard ID 在对应Storyboard中获取场景对象
#define kVCFromSb(storyboardId, storyboardName)     [[UIStoryboard storyboardWithName:storyboardName bundle:nil] \
instantiateViewControllerWithIdentifier:storyboardId]

//移除iOS7之后，cell默认左侧的分割线边距
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}

//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject


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

#endif /* Constants_h */
