//
//  LMBezierPathCorner.h
//  YuLin
//
//  Created by ml on 2018/6/22.
//  Copyright © 2018年 zhishi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMBezierPathCorner : NSObject

/**
 背景layer

 @param bounds 视图bounds
 @param rectCorner 圆角设置方向
 @param radius 圆角设置大小
 @return instance
 */
+(CAShapeLayer *)shapeLayerWithBounds:(CGRect)bounds
                           rectCorner:(UIRectCorner)rectCorner
                               radius:(CGFloat)radius;

/**
 边框layer

 @param bounds 视图bounds
 @param rectCorner 圆角设置方向
 @param radius 圆角设置大小
 @param lineWidth 边框线宽
 @param stokerColor 边框线颜色
 @param fillColor 填充色
 @return instance
 */
+(CAShapeLayer *)borderLayerWithBounds:(CGRect)bounds
                            rectCorner:(UIRectCorner)rectCorner
                                radius:(CGFloat)radius
                             lineWidth:(CGFloat)lineWidth
                            stokeColor:(UIColor *)stokerColor
                             fillColor:(UIColor *)fillColor;

+(UIImageView *)cornerWithImageView:(UIImageView *)imgView withcornerRadii:(CGFloat)radius;

+(UIImageView *)cornerWithImageView:(UIImageView *)imgView withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner;

+(UIImageView *)cornerAndBorderWithImageView:(UIImageView *)imgView
                             withcornerRadii:(CGFloat)radius
                             withBorderWidth:(float)borderWidth
                             withStrokeColor:(UIColor *)strokeColor
                               withFillColor:(UIColor *)fillColor;

+(UILabel *)cornerWithLabView:(UILabel *)labView withcornerRadii:(CGFloat)radius;

+(UILabel *)cornerWithLabView:(UILabel *)labView
              withcornerRadii:(CGFloat)radius
                  withCorners:(UIRectCorner)corner;

+(UILabel *)cornerAndBorderWithLabView:(UILabel *)labView
                       withcornerRadii:(CGFloat)radius
                       withBorderWidth:(float)borderWidth
                       withStrokeColor:(UIColor *)strokeColor
                         withFillColor:(UIColor *)fillColor;

+(UIButton *)cornerWithBtnView:(UIButton *)btnView  withcornerRadii:(CGFloat)radius;

+(UIButton *)cornerWithBtnView:(UIButton *)btnView withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner;

+(UIButton *)cornerAndBorderWithBtnView:(UIButton *)btnView
                        withcornerRadii:(CGFloat)radius
                        withBorderWidth:(float)borderWidth
                        withStrokeColor:(UIColor *)strokeColor
                          withFillColor:(UIColor *)fillColor;

+(UIView *)cornerWithView:(UIView *)view withcornerRadii:(CGFloat)radius;
+(UIView *)cornerWithView:(UIView *)view withcornerRadii:(CGFloat)radius withCorners:(UIRectCorner)corner;
+(UIView *)cornerAndBorderWithView:(UIView *)view
                   withcornerRadii:(CGFloat)radius
                   withBorderWidth:(float)borderWidth
                   withStrokeColor:(UIColor *)strokeColor
                     withFillColor:(UIColor *)fillColor;

+(UIScrollView *)cornerWithScrollView:(UIScrollView *)scrollView
                      withcornerRadii:(CGFloat)radius
                          withCorners:(UIRectCorner)corner;
@end
