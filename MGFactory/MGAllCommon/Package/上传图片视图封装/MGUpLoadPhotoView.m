//
//  MGUpLoadPhotoView.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/6.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "MGUpLoadPhotoView.h"
#import "MGUpLoadPhotoCell.h"
#import "MGUpLoadPhotoModel.h"
#import "MGUpLoadPhotoMoreCell.h"
#import "Permission.h"
#import "TZImagePickerController.h"

@interface MGUpLoadPhotoView ()<UICollectionViewDataSource,UICollectionViewDelegate,TZImagePickerControllerDelegate>

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,assign)BOOL notAddImgAction;

@end

@implementation MGUpLoadPhotoView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _curretnPageShowNum = 4;
        _edgInsets = UIEdgeInsetsMake(10,10,10,10);
        _itemSpace = 10;
        _lineSpace = 10;
        _maxAddImgNum = 4;
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

-(void)refereshUI{
    
    if (self.dataArr.count == _maxAddImgNum) {
        _notAddImgAction = YES;
    }else{
        _notAddImgAction = NO;
    }
    
    [self.collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    if (_notAddImgAction) {
        return self.dataArr.count;
    }else{
        return self.dataArr.count + 1;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    

    if (!_notAddImgAction && indexPath.row == self.dataArr.count && self.dataArr.count < _maxAddImgNum){
        
        MGUpLoadPhotoMoreCell *moreCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MGUpLoadPhotoMoreCell" forIndexPath:indexPath];
        return moreCell;
    }
    
    MGUpLoadPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MGUpLoadPhotoCell" forIndexPath:indexPath];
    cell.uploadPhotModel = [self.dataArr objectOrNilAtIndex:indexPath.row];

    MJWeakSelf;
    cell.deleteModelBlock = ^{
        [weakSelf deleteModelRefresh:indexPath.row];
    };
    
    return cell;
    
}


-(void)deleteModelRefresh:(NSInteger)indexRow{
    [self.dataArr removeObjectAtIndex:indexRow];
    [self refereshUI];
}



-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float itemWidth = (self.width - _edgInsets.left*2 - (_curretnPageShowNum - 1)*(_itemSpace))/_curretnPageShowNum;
    return CGSizeMake(itemWidth,itemWidth);
    
}

//每个section中不同的行之间的行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return _lineSpace;
}
//每个item之间的间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return _itemSpace;
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return _edgInsets;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (!_notAddImgAction && indexPath.row == self.dataArr.count) {
        [self selectImage];
    }
    
}

-(void)selectImage{
    
    if (![Permission judegmentCamera:self.vc]) {
        return;
    }
    if (![Permission judgementPhotos:self.vc]) {
        return;
    }
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:_maxAddImgNum - self.dataArr.count delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage, PHAsset *asset) {
        
    }];
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        for (UIImage *img in photos) {
            MGUpLoadPhotoModel *uploadPhotoModel = [MGUpLoadPhotoModel new];
            uploadPhotoModel.img = img;
            uploadPhotoModel.uploadUrl = self.uploadUrl;
            [self.dataArr addObject:uploadPhotoModel];
        }
        [self refereshUI];
    }];
    
    [self.vc presentViewController:imagePickerVc animated:YES completion:nil];
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0,self.width,self.height) collectionViewLayout:flowLayout];
        
        if (_scrollDirection == 0) {
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }else{
            flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        }
        
        
        //注册cell
        [_collectionView registerClass:[MGUpLoadPhotoCell class] forCellWithReuseIdentifier:@"MGUpLoadPhotoCell"];
        
        [_collectionView registerClass:[MGUpLoadPhotoMoreCell class] forCellWithReuseIdentifier:@"MGUpLoadPhotoMoreCell"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        
        [self addSubview:_collectionView];
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
