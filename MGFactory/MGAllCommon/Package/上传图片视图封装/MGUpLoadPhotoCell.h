//
//  MGUpLoadPhotoCell.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/6.
//  Copyright © 2019 longdian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MGUpLoadPhotoModel;

NS_ASSUME_NONNULL_BEGIN

@interface MGUpLoadPhotoCell : UICollectionViewCell

@property(nonatomic,strong)MGUpLoadPhotoModel *uploadPhotModel;
@property(nonatomic,strong)UIImageView *deleteView;

@property(nonatomic,copy)void(^deleteModelBlock)(void);


//上传参数
@property(nonatomic,copy)NSDictionary *params;
@end

NS_ASSUME_NONNULL_END
