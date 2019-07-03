//
//  UICollectionViewTestCell.m
//  FactoryProject
//
//  Created by 一只狗 on 2019/1/4.
//  Copyright © 2019 MingLi. All rights reserved.
//

#import "UICollectionViewTestCell.h"

@implementation UICollectionViewTestCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    _titleLab = [LDLabel labelWithFrame:CGRectMake(0, 0,self.width,self.height) withTitle:@"" withFont:16 withtextColor:[UIColor redColor] withBackColor:nil];
    _titleLab.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self addSubview:_titleLab];
}


@end
