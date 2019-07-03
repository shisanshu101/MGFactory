//
//  LDCalculationTool.m
//  YuLin
//
//  Created by ml on 2016/12/29.
//  Copyright © 2016年 zhishi. All rights reserved.
//

#import "LDCalculationTool.h"

@implementation LDCalculationTool

+ (CGSize)stringSizeWithFont:(UIFont *)font preComputeSize:(CGSize)preSize withContent:(NSString *)str{
    CGSize stringSize = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, preSize.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    
    return stringSize;
}

+ (CGSize)stringSizeHeightWithFont:(UIFont *)font preComputeSize:(CGSize)preSize withContent:(NSString *)str{
    CGSize stringSize = [str boundingRectWithSize:preSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    
    return stringSize;
}



/**
 
  文本局部文字的改变
 
 */

+ (NSMutableAttributedString *)attrStringWithAllStr:(NSString *)allStr withAttrStr:(NSString *)attrStr withChangeColor:(UIColor *)changeColor withChangeTextFont:(float)changeTextFont{
    
    if ([NSString isNotEmptyString:allStr]) {
        NSMutableAttributedString *attrDescribeStr = [[NSMutableAttributedString alloc] initWithString:allStr];
        
        
        [attrDescribeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changeTextFont] range:[allStr rangeOfString:attrStr]];
        
        if (changeColor) {
            [attrDescribeStr addAttribute:NSForegroundColorAttributeName value:changeColor range:[allStr rangeOfString:attrStr]];
        }
        
        return attrDescribeStr;
    }else{
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
}


/**
 
 创建带有图片的富文本
 
 */

+ (NSMutableAttributedString *)attrImageAndStringWithAllStr:(NSString *)allStr
                                                withAttrStr:(NSString *)attrStr
                                            withChangeColor:(UIColor *)changeColor
                                         withChangeTextFont:(UIFont*)changeTextFont
                                              withAttrImage:(UIImage *)attrImage
                                            attrImageBounds:(CGRect)attrImageRect{
    if ([NSString isNotEmptyString:allStr]) {
        NSMutableAttributedString *attrDescribeStr = [[NSMutableAttributedString alloc] initWithString:allStr];
        
        [attrDescribeStr addAttribute:NSFontAttributeName value:changeTextFont range:[allStr rangeOfString:attrStr]];
        
        if (changeColor) {
            [attrDescribeStr addAttribute:NSForegroundColorAttributeName value:changeColor range:[allStr rangeOfString:attrStr]];
        }
        
        if (attrImage) {
            NSTextAttachment *attchMent = [[NSTextAttachment alloc] init];
            attchMent.image = attrImage;
            
            attchMent.bounds = attrImageRect;
            
            NSAttributedString *attchImageStr = [NSAttributedString attributedStringWithAttachment:attchMent];
            [attrDescribeStr appendAttributedString:attchImageStr];
        }

        return attrDescribeStr;
    }else{
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
}

/**
 
 创建富文本（加入行间距和字间距）
 
 */
+(NSAttributedString *)attrLineSpaceWithAllStr:(NSString *)allStr
                                 withAttrColor:(UIColor *)attrColor
                                  withAttrFont:(UIFont *)attrFont
                                   lineSpacing:(float)lineSpace
                                   kernSpacing:(float)wordSpace{
    // 设置段落
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    // NSKernAttributeName字体间距
    if (!attrColor) {
        attrColor = [UIColor blackColor];
    }
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@(wordSpace)};
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:allStr attributes:attributes];
    // 创建文字属性
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:attrColor,NSFontAttributeName:attrFont};
    [attriStr addAttributes:attriBute range:NSMakeRange(0, allStr.length)];
    return attriStr;
    
}

/**
 
 计算富文本高度（加入行间距和字间距）
 
 */
+(CGFloat)getAttrLabelTextHeightWith:(NSString *)allStr
                           WithWidth:(CGFloat)width
                       withLineSpace:(CGFloat)lineSpace
                            withfont:(UIFont *)font withWordSpace:(CGFloat)wordSpace{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = lineSpace;
    NSDictionary *dic = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:paraStyle,NSKernAttributeName:@(wordSpace)};
    CGSize size = [allStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}




@end
