//
//  MGAlertVC.m
//  FactoryProject
//
//  Created by 一只狗 on 2019/1/11.
//  Copyright © 2019 MingLi. All rights reserved.
//

#import "MGAlertVC.h"
#import "AllViewInit.h"
#import "CKAlertViewController.h"

@interface MGAlertVC ()

@end

@implementation MGAlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    MJWeakSelf;
    LDLabel *alertLab = [LDLabel labelWithFrame:CGRectMake(10, self.titleImage.bottom + 100, ScreenWidth - 10*2, 50) withTitle:@"弹窗提示框" withFont:16 withtextColor:[UIColor colorWithHexString:@"000000"] withBackColor:[UIColor blueColor]];
    alertLab.userInteractionEnabled = YES;
    [self.view addSubview:alertLab];
    
    alertLab.clickLabel = ^{
        [weakSelf alertFunc];
    };
}


-(void)alertFunc{
    
    CKAlertViewController *alertVC = [CKAlertViewController alertControllerWithTitle:@"" message:@"确定要删除吗？" ];
    alertVC.messageAlignment = NSTextAlignmentCenter;
    alertVC.type = @"1";
    
    CKAlertAction *cancel = [CKAlertAction actionWithTitle:@"取消" handler:^(CKAlertAction *action) {
        NSLog(@"点击了 %@ 按钮",action.title);
        
    }];
    CKAlertAction *update = [CKAlertAction actionWithTitle:@"确定" handler:^(CKAlertAction *action) {
        NSLog(@"点击了 %@ 按钮",action.title);
    }];
    
    [alertVC addAction:cancel];
    [alertVC addAction:update];
    
    [self presentViewController:alertVC animated:NO completion:nil];
}



@end
