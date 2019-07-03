//
//  BaseBarBackView.h
//  FactoryProject
//
//  Created by ml on 2018/10/18.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseBarBackView : UIView

@property(nonatomic,copy)NSArray *tabbarModelArr;

@property(nonatomic,copy)void(^clickItemBlock)(NSInteger indexNum,NSString *barTitleStr,BOOL isSelected);

@end
