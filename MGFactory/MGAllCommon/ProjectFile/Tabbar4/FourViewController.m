//
//  FourViewController.m
//  FactoryProject
//
//  Created by ml on 2018/10/19.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"商城";
    self.leftButton.hidden = YES;
    [self getData];
}

-(void)getData{
     NSString *url = [NSString stringWithFormat:@"%@%@",HEADURL,API_URL_New_Weibo_indexInfo];
    
    [MGApiHelper GetUrl:url withParams:@{} success:^(id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } fail:^(NSError * _Nullable error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
