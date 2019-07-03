//
//  BaseViewController.h
//  FactoryProject
//
//  Created by ml on 2018/10/17.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import <UIKit/UIKit.h>

static inline UIEdgeInsets sgm_safeAreaInset(UIView *view) {
    if (@available(iOS 11.0, *)) {
        return view.safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}

@interface BaseViewController : UIViewController

@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *titleImage;
@property (nonatomic,strong) UIView *lineTL;

/**
 通过基类创建一个tableView，只要是继承自BaseVC且界面中只是单存的tableView列表
 那么将子类中的tableView换成baseTableView即可自动完成适配
 也可在子类中重新初始化tableView
 */
@property (nonatomic, strong) UITableView *baseTableView;
/**
 tableview距离屏幕顶部的距离
 如果有导航栏则为 44
 如果没有导航栏为 0
 默认为 44
 */
@property (nonatomic, assign) CGFloat safeTopMargin;
/**
 tableview距离屏幕底部的距离
 如果是在根视图上则为 49
 如果不是在根视图上为 0
 默认为 0
 */
@property (nonatomic, assign) CGFloat safeBottomMargin;

-(void)leftButtonClick:(UIButton *)sender;

-(void)rightButtonClick:(UIButton *)sender;
@end
