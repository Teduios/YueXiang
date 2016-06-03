//
//  YueXiangPicModel.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseModel.h"

@class YueXiangPicInfochildModel,YueXiangPicShowitemModel,YueXiangPicShowitemInfoModel,YueXiangPicRelevantModel,YueXiangPicContentModel,YueXiangPicContentInfoModel;
@interface YueXiangPicModel : BaseModel

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, strong) YueXiangPicInfochildModel *infochild;

@property (nonatomic, strong) NSArray<YueXiangPicShowitemModel *> *showitem;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, assign) NSInteger zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, strong) NSArray<YueXiangPicRelevantModel *> *relevant;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<YueXiangPicContentModel *> *content;

@property (nonatomic, copy) NSString *desc;

@end
@interface YueXiangPicInfochildModel : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *shoot;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *cn;

@end

@interface YueXiangPicShowitemModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, strong) YueXiangPicShowitemInfoModel *info;

@property (nonatomic, copy) NSString *text;

@end

@interface YueXiangPicShowitemInfoModel : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

@interface YueXiangPicRelevantModel : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubdate;

@end

@interface YueXiangPicContentModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, strong) YueXiangPicContentInfoModel *info;

@property (nonatomic, copy) NSString *text;

@end

@interface YueXiangPicContentInfoModel : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;
@end
