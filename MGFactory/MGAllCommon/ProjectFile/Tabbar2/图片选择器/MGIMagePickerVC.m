//
//  MGIMagePickerVC.m
//  FactoryProject
//
//  Created by 一只狗 on 2018/12/11.
//  Copyright © 2018 MingLi. All rights reserved.
//

#import "MGIMagePickerVC.h"
#import "TZImagePickerController.h"
#import "Permission.h"
#import "AllViewInit.h"

@interface MGIMagePickerVC ()<TZImagePickerControllerDelegate>

@end

@implementation MGIMagePickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"图片选择器";
    [self initUI];
}

-(void)initUI{
    MJWeakSelf;
    LDLabel *selectImgLab = [LDLabel labelWithFrame:CGRectMake(10, self.titleImage.bottom + 100, ScreenWidth - 10*2, 50) withTitle:@"图片选择" withFont:16 withtextColor:[UIColor colorWithHexString:@"000000"] withBackColor:[UIColor blueColor]];
    selectImgLab.userInteractionEnabled = YES;
    [self.view addSubview:selectImgLab];
    
    selectImgLab.clickLabel = ^{
        //死锁
        [weakSelf selectImage];
    };
}

-(void)selectImage{
    
    if (![Permission judegmentCamera:self]) {
        return;
    }
    if (![Permission judgementPhotos:self]) {
        return;
    }
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage, PHAsset *asset) {
        
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}

@end
