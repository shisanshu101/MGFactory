//
//  MGApiHelper.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/4.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "MGApiHelper.h"
#import "AFNetworking.h"
#import "MGApiClient.h"

@implementation MGApiHelper

+(void)GetUrl:(NSString *)urlStr withParams:(NSDictionary *)params success:(successBlock)success fail:(failBlock)fail{
    
    AFHTTPSessionManager *manager = [MGApiClient shareClient];
    
    NSMutableDictionary *newParmsDic = [NSMutableDictionary dictionaryWithDictionary:params];
    [newParmsDic setObject:YULIN_APP_VERSION forKey:@"api_version"];
    
    [manager GET:urlStr parameters:newParmsDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        NSLog(@"%@",task.response.URL.absoluteString);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}

+(void)PostUrlWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params success:(successBlock)success fail:(failBlock)fail{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *newParmsDic = [NSMutableDictionary dictionaryWithDictionary:params];
    [newParmsDic setObject:YULIN_APP_VERSION forKey:@"api_version"];
    
    [manager POST:urlStr parameters:newParmsDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}


+(void)PostImgWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params withImgArr:(NSArray *)imgArr success:(successBlock)success progress:(progressBlock)progress fail:(failBlock)fail{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *newParmsDic = [NSMutableDictionary dictionaryWithDictionary:params];
   
    [newParmsDic setObject:@"990775f787d12e64443698fab0ef5fda" forKey:@"oauth_token"];
    [newParmsDic setObject:@"f5f745d5c1a11bde35f77e9e40ce0430" forKey:@"oauth_token_secret"];
    [newParmsDic setObject:YULIN_APP_VERSION forKey:@"api_version"];
    
    [manager POST:urlStr parameters:newParmsDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i<imgArr.count; i++) {
            UIImage *img = [imgArr objectOrNilAtIndex:i];
            NSData *imageData = UIImageJPEGRepresentation(img, 0.5);
                [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"%d",i] fileName:[NSString stringWithFormat:@"image%d.jpg",i] mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress((CGFloat)uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}


@end
