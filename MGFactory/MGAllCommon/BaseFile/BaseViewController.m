//
//  BaseViewController.m
//  FactoryProject
//
//  Created by ml on 2018/10/17.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController



-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    UIEdgeInsets safeInsets = sgm_safeAreaInset(self.view);
    CGFloat height = 44;
    height += safeInsets.top > 0 ? safeInsets.top : 20;
    if (_titleImage && _titleImage.height != height) {
        _titleImage.height = height;
        _lineTL.bottom = _titleImage.bottom;
        _titleLabel.bottom = _titleImage.bottom - 3;
        _leftButton.bottom = _titleImage.bottom + 2;
        _rightButton.bottom = _titleImage.bottom + 2;
    }
}

-(void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    UIEdgeInsets safeInsets = sgm_safeAreaInset(self.view);
    if (self.baseTableView) {
        self.baseTableView.top = safeInsets.top + self.safeTopMargin;
        self.baseTableView.height = self.view.safeAreaLayoutGuide.layoutFrame.size.height - self.safeTopMargin - self.safeBottomMargin;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.safeBottomMargin = 0;
    self.safeTopMargin = 44;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F4F6F8"];
    self.navigationController.navigationBar.hidden =YES;
    [self baseViewInitUI];
}

-(void)baseViewInitUI{
    
    _titleImage = [[UIImageView alloc]init];
    _titleImage.frame = CGRectMake(0, 0,ScreenWidth, 44);
    _titleImage.backgroundColor = [UIColor whiteColor];
    _titleImage.userInteractionEnabled = YES;
    [self.view addSubview:_titleImage];

    _lineTL = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5, ScreenWidth, 0.5)];
    _lineTL.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    [_titleImage addSubview:_lineTL];

    _titleLabel = [[UILabel alloc]init];
    [_titleLabel setTextColor:COLOR_0C];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    _titleLabel.frame = CGRectMake(50, 0, ScreenWidth-100, 44);
    [_titleImage addSubview:_titleLabel];

    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(0, 11, 44, 44);
    [_leftButton setTitleColor:BLUECOLOR forState:0];
    [self.leftButton setImage:[UIImage imageNamed:@"NearShopBack"] forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_titleImage addSubview:_leftButton];

    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(ScreenWidth-52, 11, 44, 44);
    [_rightButton setTitleColor:BLUECOLOR forState:0];
    [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_titleImage addSubview:_rightButton];
    
}


-(void)leftButtonClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonClick:(UIButton *)sender{
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
