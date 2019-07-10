//
//  MGUpLoadPhotoCell.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/6.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "MGUpLoadPhotoCell.h"
#import "MGUpLoadPhotoModel.h"

@interface MGUpLoadPhotoCell ()

@property(nonatomic,strong)UIImageView *backView;
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *placeHoldLab;


@end

@implementation MGUpLoadPhotoCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
 
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.width,self.height)];
    backView.backgroundColor = [UIColor redColor];
    backView.userInteractionEnabled = YES;
    _backView = backView;
    [self.contentView addSubview:backView];
    
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 9, backView.width - 9,backView.height - 9)];
    _iconView = iconView;
    [backView addSubview:iconView];
    
    
    UIImageView *deleteView = [[UIImageView alloc] initWithFrame:CGRectMake(backView.width - 18,0, 18,18)];
    deleteView.userInteractionEnabled = YES;
    [deleteView setImage:[UIImage imageNamed:@"LDUploadImageDelete"]];
    _deleteView = deleteView;
    [backView addSubview:deleteView];
    
    UITapGestureRecognizer *deleteTap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (self.deleteModelBlock) {
            self.deleteModelBlock();
        }
    }];
    
    [deleteView addGestureRecognizer:deleteTap];
    
    UILabel *placeHoldLab = [[UILabel alloc] initWithFrame:CGRectMake(0,0, iconView.width,iconView.height)];
    placeHoldLab.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    _placeHoldLab = placeHoldLab;
    [iconView addSubview:placeHoldLab];
}


-(void)setUploadPhotModel:(MGUpLoadPhotoModel *)uploadPhotModel{
    [_iconView setImage:uploadPhotModel.img];
    
    
    [MGApiHelper PostImgWithUrl:uploadPhotModel.uploadUrl withParams:@{} withImgArr:@[uploadPhotModel.img] success:^(id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } progress:^(double progress) {
        NSLog(@"%.2f",progress);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.placeHoldLab.top =  progress*self.iconView.height;
            self.placeHoldLab.height = self.iconView.height - progress*self.iconView.height;
        });

    } fail:^(NSError * _Nullable error) {
        
    }];
    
}

@end
