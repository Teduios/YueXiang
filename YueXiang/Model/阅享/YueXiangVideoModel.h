//
//  YueXiangVideoModel.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseModel.h"

@class YueXiangVideosidlistModel,YueXiangVideolistModel;

@interface YueXiangVideoModel : BaseModel
@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<YueXiangVideosidlistModel *> *videoSidList;

@property (nonatomic, strong) NSArray<YueXiangVideolistModel *> *videoList;
@end
@interface YueXiangVideosidlistModel : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

@end

@interface YueXiangVideolistModel: NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4Url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *m3u8HdUrl;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *mp4HdUrl;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *m3u8Url;

@end
