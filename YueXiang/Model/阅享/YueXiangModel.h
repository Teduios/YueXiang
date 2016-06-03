//
//  YueXiangModel.h
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "BaseModel.h"

@class YueXiangDataModel,YueXiangDataIndexpicModel,YueXiangDataIndexpicInfochildModel,YueXiangDataIndexpicShowitemModel,YueXiangDataIndexpicShowitemInfoModel;
@interface YueXiangModel : BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) YueXiangDataModel *data;

@property (nonatomic, copy) NSString *code;

@end
@interface YueXiangDataModel : BaseModel

@property (nonatomic, strong) NSArray<YueXiangDataIndexpicModel *> *indexpic;

@property (nonatomic, strong) NSArray<YueXiangDataIndexpicModel *> *list;

@end

@interface YueXiangDataIndexpicModel : BaseModel

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) YueXiangDataIndexpicInfochildModel *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<YueXiangDataIndexpicShowitemModel *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *desc;

@end

@interface YueXiangDataIndexpicInfochildModel : BaseModel

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface YueXiangDataIndexpicShowitemModel : BaseModel

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) YueXiangDataIndexpicShowitemInfoModel *info;

@end

@interface YueXiangDataIndexpicShowitemInfoModel : BaseModel

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end
