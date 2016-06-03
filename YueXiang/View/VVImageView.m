//
//  VVImageView.m
//  YueXiang
//
//  Created by Tarena on 16/4/6.
//  Copyright © 2016年 vv. All rights reserved.
//

#import "VVImageView.h"

@implementation VVImageView

-(id)init {
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大,充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图容易减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
