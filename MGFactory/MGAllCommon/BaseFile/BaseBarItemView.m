//
//  BaseBarItemView.m
//  FactoryProject
//
//  Created by ml on 2018/10/17.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "BaseBarItemView.h"
#import "BaseBarItemModel.h"

@interface BaseBarItemView ()



@end

@implementation BaseBarItemView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    
    float titleLabHeight = 14;
    float iconWidth = 25;
    
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - iconWidth)/2,4,iconWidth,iconWidth)];
    _iconView = iconView;
    [self addSubview:iconView];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0,iconView.bottom + 3,self.width, titleLabHeight)];
    titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
    titleLab.font = [UIFont systemFontOfSize:10];
    titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab = titleLab;
    [self addSubview:titleLab];
}

-(void)setItemModel:(BaseBarItemModel *)itemModel{
    _itemModel = itemModel;
    self.titleLab.text = itemModel.selectTitleStr;
    
    [self.iconView setImage:[UIImage imageNamed:itemModel.unSelectIconStr]];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#999999"];
}

@end
