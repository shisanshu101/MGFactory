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


NS_ASSUME_NONNULL_BEGIN

@interface MGApiHelper : NSObject

+(void)GetUrl:(NSString *)urlStr
   withParams:(NSDictionary *)params
      success:(successBlock)success
         fail:(failBlock)fail;

+(void)PostUrlWithUrl:(NSString *)urlStr
           withParams:(NSDictionary *)params
              success:(successBlock)success
                 fail:(failBlock)fail;

@end

NS_ASSUME_NONNULL_END
