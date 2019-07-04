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


@end
