//
//  BaseBarItemModel.h
//  FactoryProject
//
//  Created by ml on 2018/10/17.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseBarItemModel : NSObject

@property(nonatomic,copy)NSString *selectIconStr;
@property(nonatomic,copy)NSString *unSelectIconStr;
@property(nonatomic,copy)NSString *selectTitleStr;
@property(nonatomic,copy)NSString *unSelectTitleStr;
@property(nonatomic,copy)NSString *selectTitleColorStr;
@property(nonatomic,copy)NSString *unSelectTitleColorStr;

@property(nonatomic,assign)BOOL isSelected;

@property(nonatomic,assign)NSInteger indexNum;

@end
