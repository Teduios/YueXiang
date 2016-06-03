//
//  YueXiangPicViewModel.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "YueXiangPicViewModel.h"

@implementation YueXiangPicViewModel

- (id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}
/** 防御性编程，不允许使用init初始化 */
- (id)init{
    if (self = [super init]) {
        //%s->__func__  会显示 哪个类中的哪个方法
        NSAssert1(NO, @"%s 必须使用initWithAid初始化", __func__);
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [YueXiangNetManager getPicDetailWithId:_aid completionHandle:^(id model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
}
- (NSInteger)rowNumber{
    return self.picModel.content.count;
}
- (NSURL *)picURLForRow:(NSInteger)row{
    YueXiangPicContentModel *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}

@end
