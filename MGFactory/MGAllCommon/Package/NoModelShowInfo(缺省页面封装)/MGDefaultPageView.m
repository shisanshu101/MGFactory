//
//  MGDefaultPageView.m
//  YuLin
//
//  Created by 一只狗 on 2019/2/27.
//  Copyright © 2019 zhishi. All rights reserved.
//

#import "MGDefaultPageView.h"

@implementation MGDefaultPageView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        _btnType = 1;
        self.backgroundColor = [UIColor colorWithHexString:@"#F4F6F8"];
    }
    return self;
}



//imageview
-(void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [self refreshUI];
}

-(void)setImageViewToTop:(CGFloat)imageViewToTop{
    _imageViewToTop = imageViewToTop;
    [self refreshUI];
}

-(void)setImageViewWidth:(CGFloat)imageViewWidth{
    _imageViewWidth = imageViewWidth;
    [self refreshUI];
}

-(void)setImageViewHeight:(CGFloat)imageViewHeight{
    _imageViewHeight = imageViewHeight;
    [self refreshUI];
}


//descLab

-(void)setDescStr:(NSString *)descStr{
    _descStr = descStr;
    [self refreshUI];
}

-(void)setDescLabToTop:(CGFloat)descLabToTop{
    _descLabToTop = descLabToTop;
    [self refreshUI];
}

-(void)setDescLabWidth:(CGFloat)descLabWidth{
    _descLabWidth = descLabWidth;
    [self refreshUI];
}

-(void)setDescLabHeight:(CGFloat)descLabHeight{
    _descLabHeight = descLabHeight;
    [self refreshUI];
}


//clickBtn
-(void)setClickStr:(NSString *)clickStr{
    _clickStr = clickStr;
    [self refreshUI];
}

-(void)setClickBtnToTop:(CGFloat)clickBtnToTop{
    _clickBtnToTop = clickBtnToTop;
    [self refreshUI];
}

-(void)setClickBtnWidth:(CGFloat)clickBtnWidth{
    _clickBtnWidth = clickBtnWidth;
    [self refreshUI];
}

-(void)setClickBtnHeight:(CGFloat)clickBtnHeight{
    _clickBtnHeight = clickBtnHeight;
    [self refreshUI];
}

-(void)setBtnType:(ClickBtnType)btnType{
    _btnType = btnType;
    [self refreshUI];
}


-(void)refreshUI{
    
    if ([NSString isNotEmptyString:self.imageStr]) {
        UIImage *image = [UIImage imageNamed:self.imageStr];
        
        _imageViewToTop = _imageViewToTop > 0 ? _imageViewToTop : 50;
        _imageViewWidth = _imageViewWidth > 0 ? _imageViewWidth : image.size.width;
        _imageViewHeight = _imageViewHeight > 0 ? _imageViewHeight : image.size.height;
        self.imageView.frame = CGRectMake(0,_imageViewToTop,_imageViewWidth,_imageViewHeight);
        self.imageView.centerX = self.centerX;
        self.imageView.image = image;
        [self addSubview:self.imageView];
    }else{
        self.imageView.frame = CGRectMake(0, 0, 0, 0);
    }
    
    if ([NSString isNotEmptyString:self.descStr]) {
        
        self.descLab.text = self.descStr;
        
        _descLabToTop = _descLabToTop > 0 ? _descLabToTop : 50;
        _descLabWidth = _descLabWidth > 0 ? _descLabWidth : self.width - 20;
        _descLabHeight = _descLabHeight > 0 ? _descLabHeight : 40;
        self.descLab.frame = CGRectMake(0,_imageView.bottom + _descLabToTop,_descLabWidth,_descLabHeight);
        self.descLab.centerX = self.centerX;
        [self addSubview:self.descLab];
    }else{
        self.descLab.frame = CGRectMake(0,_imageView.bottom + _descLabToTop, 0, 0);
    }
    
    if ([NSString isNotEmptyString:self.clickStr]) {
        
        [self.clickBtn setTitle:self.clickStr forState:UIControlStateNormal];
        
        _clickBtnToTop = _clickBtnToTop > 0 ? _clickBtnToTop : 20;
        _clickBtnWidth = _clickBtnWidth > 0 ? _clickBtnWidth : 140;
        _clickBtnHeight = _clickBtnHeight > 0 ? _clickBtnHeight : 36;
        self.clickBtn.frame = CGRectMake(0,_descLab.bottom + _clickBtnToTop,_clickBtnWidth,_clickBtnHeight);
        self.clickBtn.centerX = self.centerX;
        
        if (_btnType > 1) {
            self.clickBtn.layer.borderColor = [UIColorHex(#0096E6) CGColor];
            self.clickBtn.layer.borderWidth = 1;
            self.clickBtn.layer.cornerRadius = _clickBtnHeight/2.0f;
            self.clickBtn.layer.masksToBounds = YES;
        }else{
            [self.clickBtn setBackgroundImage:[UIImage imageNamed:@"yulin_submit_btn"] forState:UIControlStateNormal];
            [self.clickBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
            self.clickBtn.layer.cornerRadius = _clickBtnHeight/2.0f;
            self.clickBtn.layer.masksToBounds = YES;
        }
        
        [self addSubview:self.clickBtn];
    }else{
        self.clickBtn.frame = CGRectMake(0,_descLab.bottom + _clickBtnToTop, 0, 0);
    }
}






-(LDImageView *)imageView{
    if (!_imageView) {
        _imageView = [LDImageView imageViewWithFrame:CGRectMake(0, 0, 0, 0) withImageStr:@""];
    }
    return _imageView;
}

-(LDLabel *)descLab{
    if (!_descLab) {
        _descLab = [LDLabel labelWithFrame:CGRectMake(0, 0, 0, 0) withTitle:@"" withFont:14 withtextColor:[UIColor colorWithHexString:@"#999999"] withBackColor:nil];
    }
    return _descLab;
}

-(LDButton *)clickBtn{
    if (!_clickBtn) {
        _clickBtn = [LDButton buttonWithFrame:CGRectMake(0, 0, 0, 0) withTitle:@"" withTitleColor:[UIColor colorWithHexString:@"#0096E6"] withImage:nil withFont:16];
    }
    return _clickBtn;
}

-(void)dealloc {
    DebugLog(@"默认空白占位图释放了");
}

@end
