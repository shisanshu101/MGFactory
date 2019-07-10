//
//  MGUpLoadPhotoMoreCell.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/6.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "MGUpLoadPhotoMoreCell.h"

@implementation MGUpLoadPhotoMoreCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.width,self.height)];
    [self.contentView addSubview:backView];
    
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, backView.width - 10,backView.height - 10)];
    [iconView setImage:[UIImage imageNamed:@"NewAddPhoto"]];
    [backView addSubview:iconView];
    
}

@end
