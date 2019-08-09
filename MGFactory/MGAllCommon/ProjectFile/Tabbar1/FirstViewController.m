//
//  FirstViewController.m
//  FactoryProject
//
//  Created by ml on 2018/10/19.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "FirstViewController.h"
#import "TestVC.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"首页";
    self.leftButton.hidden = YES;
    [self.rightButton setTitle:@"测试" forState:UIControlStateNormal];
    
    NSLog(@"123");
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
        DebugLog(@"点击了首页");
    }]];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    NSString *titleStr = NSLocalizedString(@"click", nil);
    [btn setTitle:titleStr forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    [MGApiHelper PostUrlWithUrl:@"http://gateway.jarppk.com/Sailboat/api/members" withParams:@{@"username":@"aaaggg",@"password":@"123123"} success:^(id  _Nullable responseObject) {
        NSString *str= [NSString stringWithFormat:@"%@",responseObject];
        NSLog(@"%@", str);
    } fail:^(NSError * _Nullable error) {
        
    }];
}

-(void)rightButtonClick:(UIButton *)sender{
    [self.navigationController pushViewController:[TestVC new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
