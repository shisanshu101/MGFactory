//
//  LDCalculationTool.h
//  YuLin
//
//  Created by ml on 2016/12/29.
//  Copyright © 2016年 zhishi. All rights reserved.    
//

#import <Foundation/Foundation.h>

@interface LDCalculationTool : NSObject

//计算可变文本高度
+ (CGSize)stringSizeWithFont:(UIFont *)font preComputeSize:(CGSize)preSize withContent:(NSString *)str;

+ (CGSize)stringSizeHeightWithFont:(UIFont *)font preComputeSize:(CGSize)preSize withContent:(NSString *)str;


//文本局部文字的改变
+(NSAttributedString *)attrStringWithAllStr:(NSString *)allStr
                                withAttrStr:(NSString *)attrStr
                            withChangeColor:(UIColor *)changeColor
                         withChangeTextFont:(float)changeTextFont;

//弹窗文本的设置



//创建带有图片的富文本
+ (NSMutableAttributedString *)attrImageAndStringWithAllStr:(NSString *)allStr
                                                withAttrStr:(NSString *)attrStr
                                            withChangeColor:(UIColor *)changeColor
                                         withChangeTextFont:(UIFont*)changeTextFont withAttrImage:(UIImage *)attrImage
                                            attrImageBounds:(CGRect)attrImageRect;
//创建富文本(加入行间距)
+(NSAttributedString *)attrLineSpaceWithAllStr:(NSString *)allStr
                                 withAttrColor:(UIColor *)attrColor
                                  withAttrFont:(UIFont *)attrFont
                                   lineSpacing:(float)lineSpace
                                   kernSpacing:(float)wordSpace;


//计算富文本的高度
+(CGFloat)getAttrLabelTextHeightWith:(NSString *)allStr
                           WithWidth:(CGFloat)width
                       withLineSpace:(CGFloat)lineSpace
                            withfont:(UIFont *)font withWordSpace:(CGFloat)wordSpace;
@end
