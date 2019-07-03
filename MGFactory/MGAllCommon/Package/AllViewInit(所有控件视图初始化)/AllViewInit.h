//
//  AllViewInit.h
//  YuLin
//
//  Created by ml on 16/12/9.
//  Copyright © 2016年 zhishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllViewInit : UIView

@end




#pragma mark -UIImageView-
@interface LDImageView : UIImageView
+(LDImageView *)imageViewWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr;

+(LDImageView *)imageViewWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr isNeedCircle:(BOOL)isCircle;

@property(nonatomic,copy)void(^clickImage)(void);

@property(nonatomic,assign)BOOL isSelected;

@end



#pragma mark -UILabel-
@interface LDLabel : UILabel
+(LDLabel *)labelWithFrame:(CGRect)frame withTitle:(NSString *)title withFont:(float)font withtextColor:(UIColor *)textColor withBackColor:(UIColor *)backColor;

@property(nonatomic,copy)void(^clickLabel)(void);

@end

@interface LDButton : UIButton

@property(nonatomic,copy)void(^clickBtn)(void);


+ (LDButton *)buttonWithFrame:(CGRect)frame withTitle:(NSString *)title withTitleColor:(UIColor *)color withImage:(NSString *)imageStr withFont:(float)font;

@end





