//
//  MGApiClient.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/4.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "MGApiClient.h"

static MGApiClient *_sharedClient = nil;

@implementation MGApiClient


+(instancetype)shareClient{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [MGApiClient new];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
        [_sharedClient.requestSerializer setValue:@"http://longyu.cc/ios" forHTTPHeaderField:@"Referer"];
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        _sharedClient.requestSerializer.timeoutInterval = 10;
    });
    return _sharedClient;
}

@end
