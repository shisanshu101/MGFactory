//
//  MGUpLoadPhotoModel.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/6.
//  Copyright © 2019 longdian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGUpLoadPhotoModel : NSObject

@property(nonatomic,strong)UIImage *img;
/// 上传Url
@property(nonatomic,copy)NSString *uploadUrl;

/// 上传成功
@property(nonatomic,assign)BOOL uploadSuccess;
//自定义字段
@property(nonatomic,assign)BOOL isloading;
@property(nonatomic,copy)NSString *resultImgId;

@end

NS_ASSUME_NONNULL_END
