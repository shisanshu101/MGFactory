//
//  MGDefaultPageView.h
//  YuLin
//
//  Created by 一只狗 on 2019/2/27.
//  Copyright © 2019 zhishi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum: NSInteger{
    BlueBtn = 1,  //渐变色的按钮
    WriteBtn = 2   //边框蓝色，中间空白镂空白色
}ClickBtnType;

NS_ASSUME_NONNULL_BEGIN

@interface MGDefaultPageView : UIView


@property(nonatomic,strong)LDImageView *imageView;
@property(nonatomic,strong)LDLabel *descLab;
@property(nonatomic,strong)LDButton *clickBtn;

@property(nonatomic,copy)NSString *imageStr;
@property(nonatomic,copy)NSString *descStr;
@property(nonatomic,copy)NSString *clickStr;

@property(nonatomic,assign)CGFloat imageViewToTop;
@property(nonatomic,assign)CGFloat imageViewWidth;
@property(nonatomic,assign)CGFloat imageViewHeight;

@property(nonatomic,assign)CGFloat descLabToTop;
@property(nonatomic,assign)CGFloat descLabWidth;
@property(nonatomic,assign)CGFloat descLabHeight;

@property(nonatomic,assign)CGFloat clickBtnToTop;
@property(nonatomic,assign)CGFloat clickBtnWidth;
@property(nonatomic,assign)CGFloat clickBtnHeight;
@property(nonatomic,assign)ClickBtnType btnType;

@end

NS_ASSUME_NONNULL_END
