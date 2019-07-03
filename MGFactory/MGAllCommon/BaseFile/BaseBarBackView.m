//
//  BaseBarBackView.m
//  FactoryProject
//
//  Created by ml on 2018/10/18.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "BaseBarBackView.h"
#import "BaseBarItemView.h"
#import "BaseBarItemModel.h"

static NSInteger itemViewTag = 999;

@interface BaseBarBackView ()

@property(nonatomic,strong)NSMutableArray *saveViewArr;
@property(nonatomic,strong)NSMutableArray *saveModelArr;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *unImgArr;
@property(nonatomic,strong)NSArray *selectimgArr;
@property(nonatomic,strong)UIButton *centerBtn;

@end

@implementation BaseBarBackView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {

        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowOffset = CGSizeMake(0,0);
        self.layer.shadowRadius = 1;
    }
    return self;
}


-(void)setTabbarModelArr:(NSArray *)tabbarModelArr{
    _tabbarModelArr = tabbarModelArr;
    [self createUI];
}

-(void)createUI{
    self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    

    
    self.titleArr = @[@"首页",@"发现",@"发布",@"商城",@"我的"];
    self.unImgArr = @[@"tabbar1",@"tabbar2",@"issue-icon",@"tabbar4",@"tabbar5"];
    self.selectimgArr = @[@"tabbar1-selest",@"tabbar2-selest",@"issue-icon",@"tabbar4-selest",@"tabbar5-selest"];
    
    float itemWidth = self.width*1.0/self.titleArr.count;
    
    for (int i = 0; i < self.titleArr.count; i++) {
        
        BaseBarItemView *itemView = [[BaseBarItemView alloc] initWithFrame:CGRectMake(itemWidth*i,0,itemWidth,self.height)];
        itemView.tag = itemViewTag + i;
        BaseBarItemModel *itemModel = [BaseBarItemModel new];
        
        if ([NSArray isNotEmptyArray:self.tabbarModelArr]) {
            
            
            if (self.tabbarModelArr.count == self.titleArr.count) {
                itemModel = [self.tabbarModelArr objectOrNilAtIndex:i];
            }else{
                
                if (itemModel.indexNum == i) {
                    itemModel = [self.tabbarModelArr objectOrNilAtIndex:i];
                }else{
                    itemModel.selectTitleStr = [self.titleArr objectOrNilAtIndex:i];
                    itemModel.selectIconStr = [self.selectimgArr objectOrNilAtIndex:i];
                    itemModel.unSelectIconStr = [self.unImgArr objectOrNilAtIndex:i];
                }
                
            }
            
        }else{
            itemModel.selectTitleStr = [self.titleArr objectOrNilAtIndex:i];
            itemModel.selectIconStr = [self.selectimgArr objectOrNilAtIndex:i];
            itemModel.unSelectIconStr = [self.unImgArr objectOrNilAtIndex:i];
        }
        itemView.itemModel = itemModel;
        [self.saveModelArr addObject:itemModel];
        [self.saveViewArr addObject:itemView];
        
        if (i == 0) {
            [itemView.iconView setImage:[UIImage imageNamed:itemModel.selectIconStr]];
            itemView.titleLab.textColor = [UIColor colorWithHexString:@"0196E6"];
        }

        if (i == 2) {
            itemView.iconView.hidden = YES;
            UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            centerBtn.backgroundColor = [UIColor clearColor];
            [centerBtn setImage:[UIImage imageNamed:itemModel.selectIconStr] forState:0];
            centerBtn.frame =CGRectMake((itemView.width - 51)/2,-20,51,51);
            centerBtn.clipsToBounds = YES;
            centerBtn.layer.cornerRadius = centerBtn.width/2.0;
            [centerBtn setBackgroundColor:[UIColor whiteColor]];
            //button点击的时候取消高亮
            centerBtn.adjustsImageWhenHighlighted =NO;
            centerBtn.userInteractionEnabled = YES;
            [centerBtn addTarget:self action:@selector(centerClick) forControlEvents:UIControlEventTouchUpInside];
            [centerBtn addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressBtn:)]];
            _centerBtn = centerBtn;
            [itemView addSubview:centerBtn];
        }else{
            [itemView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickItemView:)]];
        }
        [self addSubview:itemView];
    }
}


-(void)centerClick{

    DebugLog(@"点击了加号++++++++");
    
    [self clickBtnRefreshUI];
    
    BaseBarItemView *itemView = [self.saveViewArr objectOrNilAtIndex:2];
    itemView.titleLab.textColor = [UIColor colorWithHexString:@"0196E6"];
}

-(void)longPressBtn:(UIGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan ) {
        DebugLog(@"长按了加号++++++++");
    }
}



-(void)clickBtnRefreshUI{
    for (int i = 0; i < self.saveViewArr.count; i++) {
        BaseBarItemView *itemView = [self.saveViewArr objectOrNilAtIndex:i];
        BaseBarItemModel *itemModel = [self.saveModelArr objectOrNilAtIndex:i];
        itemModel.isSelected = NO;
        [itemView.iconView setImage:[UIImage imageNamed:itemModel.unSelectIconStr]];
        
        if ([NSString isNotEmptyString:itemModel.unSelectTitleColorStr]) {
            itemView.titleLab.textColor = [UIColor colorWithHexString:itemModel.unSelectTitleColorStr];
        }else{
            itemView.titleLab.textColor = [UIColor colorWithHexString:@"#999999"];
        }
    }
}


-(void)clickItemView:(UITapGestureRecognizer *)tap{

    [self clickBtnRefreshUI];
    
    NSInteger tag = tap.view.tag - itemViewTag;
    BaseBarItemView *itemView = [self.saveViewArr objectOrNilAtIndex:tag];
    BaseBarItemModel *itemModel = [self.saveModelArr objectOrNilAtIndex:tag];
    itemModel.isSelected = YES;
    
    [itemView.iconView setImage:[UIImage imageNamed:itemModel.selectIconStr]];
    
    if ([NSString isNotEmptyString:itemModel.selectTitleColorStr]) {
        itemView.titleLab.textColor = [UIColor colorWithHexString:itemModel.selectTitleColorStr];
    }else{
        itemView.titleLab.textColor = [UIColor colorWithHexString:@"#39A1FB"];
    }
    
    
    NSString *titleStr = [self.titleArr objectOrNilAtIndex:tag];
    
    if (self.clickItemBlock) {
        self.clickItemBlock(tag,titleStr,itemModel.isSelected);
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) { // 当前界面 tabBar显示
        
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) { // 点 属于按钮范围
            return self.centerBtn;
            
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

-(NSMutableArray *)saveViewArr{
    if (!_saveViewArr) {
        _saveViewArr = [NSMutableArray new];
    }
    return _saveViewArr;
}

-(NSMutableArray *)saveModelArr{
    if (!_saveModelArr) {
        _saveModelArr = [NSMutableArray new];
    }
    return _saveModelArr;
}



@end
