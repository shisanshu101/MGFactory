//
//  BaseTabBarController.m
//  FactoryProject
//
//  Created by ml on 2018/10/17.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseBarBackView.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "BaseBarItemModel.h"

@interface BaseTabBarController ()

@property(nonatomic,strong)BaseBarBackView *bgView;
@property(nonatomic,strong)NSMutableArray *tabbarModelArr;

@end

@implementation BaseTabBarController


+(instancetype)shareBaseTabBarVC{
    
    static BaseTabBarController *singleObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleObj = [[self alloc]init];
    });
    return singleObj;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    self.tabBar.hidden = YES;
    
    if (@available(iOS 11.0, *)) {
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)createUI{
    MJWeakSelf;
    [self.view addSubview:self.bgView];
    
    
    FirstViewController *firstVc = [FirstViewController new];
    SecondViewController *secVc = [SecondViewController new];
    ThirdViewController *thirdVc = [ThirdViewController new];
    FourViewController *fourVc = [FourViewController new];
    FiveViewController *fiveVc = [FiveViewController new];
    
    self.viewControllers = @[firstVc,secVc,thirdVc,fourVc,fiveVc];
    
    NSArray *titleArr = @[@"首页",@"发现",@"发布",@"商城",@"我的"];
    NSArray *unImgArr = @[@"tabbar1",@"tabbar2",@"tabbar3",@"tabbar4",@"tabbar5"];
    NSArray *selectimgArr = @[@"tabbar1-selest",@"tabbar2-selest",@"tabbar3-selest",@"tabbar4-selest",@"tabbar5-selest"];
    
    for (int i = 0; i < 5; i++) {
        BaseBarItemModel *itemModel = [BaseBarItemModel new];
        itemModel.selectIconStr = [selectimgArr objectOrNilAtIndex:i];
        itemModel.unSelectIconStr = [unImgArr objectOrNilAtIndex:i];
        itemModel.selectTitleStr = [titleArr objectOrNilAtIndex:i];
        
        if (i == 3) {
            itemModel.selectTitleColorStr = @"#F5A623";
        }
        
        [self.tabbarModelArr addObject:itemModel];
    }
    
    self.bgView.tabbarModelArr = self.tabbarModelArr;
    
    self.bgView.clickItemBlock = ^(NSInteger indexNum, NSString *barTitleStr, BOOL isSelected) {
        [weakSelf setSelectedIndex:indexNum];
        
        if (isSelected) {
            DebugLog(@"选中了%@---%zd",barTitleStr,indexNum);
        }else{
            DebugLog(@"取消选中了%@---%zd",barTitleStr,indexNum);
        }
    };
}

-(BaseBarBackView *)bgView{
    if (!_bgView) {
        _bgView = [[BaseBarBackView alloc] initWithFrame:CGRectMake(0,ScreenHeight-50, ScreenWidth, 50)];
    }
    return _bgView;
}

-(NSMutableArray *)tabbarModelArr{
    if (!_tabbarModelArr) {
        _tabbarModelArr = [NSMutableArray new];;
    }
    return _tabbarModelArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
