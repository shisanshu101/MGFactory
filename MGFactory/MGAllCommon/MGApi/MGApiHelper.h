//
//  MGApiHelper.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/4.
//  Copyright © 2019 longdian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id _Nullable responseObject);
typedef void(^failBlock)(NSError * _Nullable error);
typedef void(^progressBlock)(double progress);

NS_ASSUME_NONNULL_BEGIN

@interface MGApiHelper : NSObject

/**
 加载数据
 */
+(void)GetUrl:(NSString *)urlStr
   withParams:(NSDictionary *)params
      success:(successBlock)success
         fail:(failBlock)fail;

/**
 数据上传
 */
+(void)PostUrlWithUrl:(NSString *)urlStr
           withParams:(NSDictionary *)params
              success:(successBlock)success
                 fail:(failBlock)fail;

/**
 图片上传
 */
+(void)PostImgWithUrl:(NSString *)urlStr
           withParams:(NSDictionary *)params
           withImgArr:(NSArray *)imgArr
              success:(successBlock)success
             progress:(progressBlock)progress
                 fail:(failBlock)fail;

@end

NS_ASSUME_NONNULL_END
