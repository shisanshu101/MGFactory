//
//  UICollectionViewTestVC.m
//  FactoryProject
//
//  Created by 一只狗 on 2019/1/4.
//  Copyright © 2019 MingLi. All rights reserved.
//

#import "UICollectionViewTestVC.h"
#import "UICollectionViewTestCell.h"

@interface UICollectionViewTestVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation UICollectionViewTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
}

-(void)getData{
    for (int i = 0; i<20; i++) {
        NSString *str = [NSString stringWithFormat:@"鱼圈%d",i];
        [self.dataArr addObject:str];
    }
    [self.collectionView reloadData];
}

#pragma mark -----------------------协议方法-----------------------

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewTestCell" forIndexPath:indexPath];
    cell.titleLab.text = [self.dataArr objectOrNilAtIndex:indexPath.row];
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float itemWidth = (ScreenWidth - 5*10)/4.0;
    return CGSizeMake(itemWidth,itemWidth);
    
}

//每个section中不同的行之间的行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//每个item之间的间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10,10,10,10);
}


#pragma mark -----------------------懒加载-----------------------

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        float itemWidth = (ScreenWidth - 5*10)/4.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,64,ScreenWidth,itemWidth*2 + 10*3) collectionViewLayout:flowLayout];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //注册cell
        [_collectionView registerClass:[UICollectionViewTestCell class] forCellWithReuseIdentifier:@"UICollectionViewTestCell"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];

        [self.view addSubview:_collectionView];
    }
    
    return _collectionView;
}


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}



@end
