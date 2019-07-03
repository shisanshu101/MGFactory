//
//  LMBezierPathCorner.m
//  YuLin
//
//  Created by ml on 2018/6/22.
//  Copyright © 2018年 zhishi. All rights reserved.
//

#import "LMBezierPathCorner.h"

@implementation LMBezierPathCorner

+(UIImageView *)cornerWithImageView:(UIImageView *)imgView withcornerRadii:(CGFloat)radius{
    
    if (imgView) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imgView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius,radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = imgView.bounds;
        maskLayer.path = path.CGPath;
        imgView.layer.mask = maskLayer;
    }
    return imgView;
}


+(UIImageView *)cornerWithImageView:(UIImageView *)imgView withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner{
    
    if (imgView) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imgView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius,radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = imgView.bounds;
        maskLayer.path = path.CGPath;
        imgView.layer.mask = maskLayer;
    }
    return imgView;
}


+(UIImageView *)cornerAndBorderWithImageView:(UIImageView *)imgView withcornerRadii:(CGFloat)radius withBorderWidth:(float)borderWidth withStrokeColor:(UIColor *)strokeColor withFillColor:(UIColor *)fillColor{
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, imgView.width, imgView.height);
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, imgView.width, imgView.height);
    borderLayer.lineWidth = borderWidth;
    borderLayer.strokeColor = strokeColor.CGColor;
    borderLayer.fillColor = fillColor.CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:imgView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    
    [imgView.layer insertSublayer:borderLayer atIndex:0];
    [imgView.layer setMask:maskLayer];
    
    return imgView;
}




+(UILabel *)cornerWithLabView:(UILabel *)labView withcornerRadii:(CGFloat)radius{
    
    if (labView) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:labView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = labView.bounds;
        maskLayer.path = path.CGPath;
        labView.layer.mask = maskLayer;
    }
    return labView;
}

+(UILabel *)cornerWithLabView:(UILabel *)labView withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner{
    
    if (labView) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:labView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius,radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = labView.bounds;
        maskLayer.path = path.CGPath;
        labView.layer.mask = maskLayer;
    }
    return labView;
}



+(UILabel *)cornerAndBorderWithLabView:(UILabel *)labView withcornerRadii:(CGFloat)radius withBorderWidth:(float)borderWidth withStrokeColor:(UIColor *)strokeColor withFillColor:(UIColor *)fillColor{
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, labView.width, labView.height);
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, labView.width, labView.height);
    borderLayer.lineWidth = borderWidth;
    borderLayer.strokeColor = strokeColor.CGColor;
    borderLayer.fillColor = fillColor.CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:labView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius,radius)];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    
    [labView.layer insertSublayer:borderLayer atIndex:0];
    [labView.layer setMask:maskLayer];
    
    return labView;
}


+(UIButton *)cornerWithBtnView:(UIButton *)btnView withcornerRadii:(CGFloat)radius{
    
    if (btnView) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:btnView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = btnView.bounds;
        maskLayer.path = path.CGPath;
        btnView.layer.mask = maskLayer;
    }
    return btnView;
}

+(UIButton *)cornerWithBtnView:(UIButton *)btnView withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner{
    if (btnView) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:btnView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = btnView.bounds;
        maskLayer.path = path.CGPath;
        btnView.layer.mask = maskLayer;
    }
    return btnView;
}


+(UIButton *)cornerAndBorderWithBtnView:(UIButton *)btnView withcornerRadii:(CGFloat)radius withBorderWidth:(float)borderWidth withStrokeColor:(UIColor *)strokeColor withFillColor:(UIColor *)fillColor{
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, btnView.width, btnView.height);
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, btnView.width, btnView.height);
    borderLayer.lineWidth = borderWidth;
    borderLayer.strokeColor = strokeColor.CGColor;
    borderLayer.fillColor = fillColor.CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:btnView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    
    [btnView.layer insertSublayer:borderLayer atIndex:0];
    [btnView.layer setMask:maskLayer];
    
    return btnView;
}



+(UIView *)cornerWithView:(UIView *)view withcornerRadii:(CGFloat)radius{
    
    if (view) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = view.bounds;
        maskLayer.path = path.CGPath;
        view.layer.mask = maskLayer;
    }
    return view;
}

+(UIView *)cornerWithView:(UIView *)view withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner{
    if (view) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = view.bounds;
        maskLayer.path = path.CGPath;
        view.layer.mask = maskLayer;
    }
    return view;
}

+(UIView *)cornerAndBorderWithView:(UIView *)view withcornerRadii:(CGFloat)radius withBorderWidth:(float)borderWidth withStrokeColor:(UIColor *)strokeColor withFillColor:(UIColor *)fillColor{
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, view.width, view.height);
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, view.width, view.height);
    borderLayer.lineWidth = borderWidth;
    borderLayer.strokeColor = strokeColor.CGColor;
    borderLayer.fillColor = fillColor.CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    
    [view.layer insertSublayer:borderLayer atIndex:0];
    [view.layer setMask:maskLayer];
    
    return view;
}

+(UIScrollView *)cornerWithScrollView:(UIScrollView *)scrollView withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner{
    if (scrollView) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:scrollView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = scrollView.bounds;
        maskLayer.path = path.CGPath;
        scrollView.layer.mask = maskLayer;
    }
    return scrollView;
}

+(CAShapeLayer *)shapeLayerWithBounds:(CGRect)bounds rectCorner:(UIRectCorner)rectCorner radius:(CGFloat)radius {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = bounds;
    shapeLayer.path = bezierPath.CGPath;
    return shapeLayer;
}

+(CAShapeLayer *)borderLayerWithBounds:(CGRect)bounds rectCorner:(UIRectCorner)rectCorner radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth stokeColor:(UIColor *)stokerColor fillColor:(UIColor *)fillColor {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *borderColor = [CAShapeLayer layer];
    borderColor.frame = bounds;
    borderColor.lineWidth = lineWidth;
    borderColor.strokeColor = stokerColor.CGColor;
    borderColor.fillColor = fillColor.CGColor;
    borderColor.path = bezierPath.CGPath;
    return borderColor;
}

@end
