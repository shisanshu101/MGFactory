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
#import "MGUpLoadPhotoView.h"

@interface MGIMagePickerVC ()<TZImagePickerControllerDelegate>

@property(nonatomic,strong)MGUpLoadPhotoView *uploadPhotView;

@property(nonatomic,strong)LDLabel *selectImgLab;

@end

@implementation MGIMagePickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"图片选择器";
    [self initUI];
}

-(void)initUI{
    [self.view addSubview:self.uploadPhotView];
}


-(MGUpLoadPhotoView *)uploadPhotView{
    if (!_uploadPhotView) {
        _uploadPhotView = [[MGUpLoadPhotoView alloc] initWithFrame:CGRectMake(10, 100,ScreenWidth - 10*2, 200)];
        _uploadPhotView.maxAddImgNum = 3;
        _uploadPhotView.scrollDirection = ScrollDirectionVertical;
        NSString *url = [NSString stringWithFormat:@"%@%@",HEADURL,Api_URL_MallStore_upload_reg];
        _uploadPhotView.uploadUrl = url;
        _uploadPhotView.vc = self;
        [_uploadPhotView refereshUI];
        
    }
    
    return _uploadPhotView;
}



@end
