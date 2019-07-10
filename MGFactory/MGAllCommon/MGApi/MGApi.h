//
//  MGApi.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/4.
//  Copyright © 2019 longdian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGApi : NSObject

//服务器
extern NSString *const HEADURL;
//版本控制
extern NSString * const YULIN_APP_VERSION;

extern NSString *const API_URL_New_Weibo_indexInfo;//新的首页顶部信息接口

extern NSString *const Api_URL_MallStore_upload_reg;//店铺注册时附件上传

@end

NS_ASSUME_NONNULL_END
