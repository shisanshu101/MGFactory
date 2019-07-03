//
//  MGIMGScrollAndEnlargeVC.m
//  FactoryProject
//
//  Created by 一只狗 on 2019/3/7.
//  Copyright © 2019 MingLi. All rights reserved.
//

#import "MGIMGScrollAndEnlargeVC.h"

@interface MGIMGScrollAndEnlargeVC ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *srollView;
@property(nonatomic,strong)UIImageView *imgV;

@end

@implementation MGIMGScrollAndEnlargeVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
}

-(void)createUI{
    //初始化滚动视图
    _srollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_srollView];
    
    //初始化imageview，设置图片
    _imgV = [[UIImageView alloc]init];
    _imgV.image = [UIImage imageNamed:@"test1.jpg"];
    _imgV.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64);
    [_srollView addSubview:_imgV];
    
    //设置代理,设置最大缩放和虽小缩放
    _srollView.delegate = self;
    _srollView.maximumZoomScale = 5;
    _srollView.minimumZoomScale = 1;
    
    //设置UIScrollView的滚动范围和图片的真实尺寸一致
    _srollView.contentSize = _imgV.image.size;

}

//代理方法，告诉ScrollView要缩放的是哪个视图
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgV;
}


@end
