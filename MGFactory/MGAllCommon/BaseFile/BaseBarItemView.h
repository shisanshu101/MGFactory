//
//  BaseBarItemView.h
//  FactoryProject
//
//  Created by ml on 2018/10/17.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseBarItemModel;

@interface BaseBarItemView : UIView

@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)BaseBarItemModel *itemModel;

@end
