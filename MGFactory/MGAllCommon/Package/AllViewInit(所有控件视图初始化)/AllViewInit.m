//
//  AllViewInit.m
//  YuLin
//
//  Created by ml on 16/12/9.
//  Copyright © 2016年 zhishi. All rights reserved.
//

#import "AllViewInit.h"

@implementation AllViewInit

#pragma mark -imageView-

#pragma mark -label-


#pragma mark -UITextField-


@end

#pragma mark --------------UIImageView--------------------
@implementation LDImageView
+(LDImageView *)imageViewWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr{
    
    LDImageView *imageView = [LDImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.frame = frame;
    if ([NSString isNotEmptyString:imageStr]) {
        imageView.image = [UIImage imageNamed:imageStr];
    }
    
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:imageView action:@selector(clickImageAction)]];
    
    return imageView;
}

/**
 isCircle : BOOL类型，判断是否需要切圆角
 */

+(LDImageView *)imageViewWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr isNeedCircle:(BOOL)isCircle{
    
    LDImageView *imageView = [LDImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.frame = frame;
    if ([NSString isNotEmptyString:imageStr]) {
        imageView.image = [UIImage imageNamed:imageStr];
    }

    if (isCircle) {
        //切圆角
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
        
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        //设置大小
        maskLayer.frame = imageView.bounds;
        //设置图形样子
        maskLayer.path = maskPath.CGPath;
        imageView.layer.mask = maskLayer;
    }
    
    
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:imageView action:@selector(clickImageAction)]];
    
    return imageView;
}




-(void)clickImageAction{
    if (self.clickImage) {
        self.clickImage();
    }
}
@end


#pragma mark --------------UIlabel--------------------
@implementation LDLabel
+(LDLabel *)labelWithFrame:(CGRect)frame withTitle:(NSString *)title withFont:(float)font withtextColor:(UIColor *)textColor withBackColor:(UIColor *)backColor{
    
    LDLabel *label = [LDLabel new];
    label.frame = frame;
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.textColor = textColor;
    label.backgroundColor = backColor;
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:label action:@selector(clickLabelAction)]];
    
    
    return label;
    
}


-(void)clickLabelAction{
    if (self.clickLabel) {
        self.clickLabel();
    }
}



@end

@implementation LDButton



+ (LDButton *)buttonWithFrame:(CGRect)frame withTitle:(NSString *)title withTitleColor:(UIColor *)color withImage:(NSString *)imageStr withFont:(float)font{
    
    LDButton *button = [LDButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
    if ([NSString isNotEmptyString:imageStr]) {
        [button setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    }
    [button addTarget:button action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)buttonAction:(LDButton *)button{
    if (self.clickBtn) {
        self.clickBtn();
    }
}

@end

