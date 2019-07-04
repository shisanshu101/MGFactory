//
//  MGApiClient.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/4.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGApiClient : AFHTTPSessionManager

+(instancetype)shareClient;

@end

NS_ASSUME_NONNULL_END
