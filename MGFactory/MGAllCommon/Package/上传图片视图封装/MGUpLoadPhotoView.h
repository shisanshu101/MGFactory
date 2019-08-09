//
//  MGUpLoadPhotoView.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/6.
//  Copyright © 2019 longdian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UploadPhotoScrollDirection) {
    /// 横滑
    ScrollDirectionHorizontal = 0,
    /// 竖滑
    ScrollDirectionVertical = 1
};

@interface MGUpLoadPhotoView : UIView

@property(nonatomic,assign)UIEdgeInsets edgInsets;

@property(nonatomic,assign)CGFloat itemSpace;
@property(nonatomic,assign)CGFloat lineSpace;
/// 当前屏幕显示几个视图
@property(nonatomic,assign)CGFloat curretnPageShowNum;

/// 最多添加多少张图片
@property(nonatomic,assign)NSInteger maxAddImgNum;

/// 横滑还是竖滑
@property(nonatomic,assign)UploadPhotoScrollDirection scrollDirection;

/// 最多添加多少张图片
@property(nonatomic,weak)UIViewController *vc;
@property(nonatomic,copy)void(^addPhotoBlock)(void);
//上传参数
@property(nonatomic,copy)NSString *uploadUrl;

-(void)refereshUI;

-(BOOL)isFinishUpload;

-(NSArray *)getImgIdArr;
@end

NS_ASSUME_NONNULL_END
