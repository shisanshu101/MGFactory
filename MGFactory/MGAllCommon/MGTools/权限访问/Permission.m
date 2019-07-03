//
//  Permission.m
//  FactoryProject
//
//  Created by 一只狗 on 2018/12/11.
//  Copyright © 2018 MingLi. All rights reserved.
//

#import "Permission.h"

@implementation Permission

+(BOOL)judegmentCamera:(UIViewController *)vc{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        //未授权，家长限制     玩家未授权
        UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"允许“龙巅鱼邻”在你使用APP时访问你的相机？" message:@"否则将无法拍摄照片发布图文帖和长贴，以及发布商品的图片，无法拍摄视频发布长贴"
                                                             preferredStyle:UIAlertControllerStyleAlert];
        [aC addAction:[UIAlertAction actionWithTitle:@"去开启"
                                               style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction * _Nonnull action) {
                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                                 
                                             }]];
        [aC addAction:[UIAlertAction actionWithTitle:@"知道了"
                                               style:UIAlertActionStyleCancel
                                             handler:^(UIAlertAction * _Nonnull action) {}]];
        [vc presentViewController:aC animated:YES completion:NULL];
        
        return NO;
    }else if (authStatus == AVAuthorizationStatusNotDetermined) {
        //没有询问是否开启相机
        [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
            if (!granted) {
                UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"提示" message:@"若您未允许使用相机则后续部分功能将出现不可预测的情况" preferredStyle:UIAlertControllerStyleAlert];
                [aC addAction:[UIAlertAction actionWithTitle:@"知道了"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * _Nonnull action) {}]];
                [vc presentViewController:aC animated:YES completion:NULL];
            }
        }];
        
        return NO;
    }else {
        //玩家授权
        return YES;
    }
}

+(BOOL)judgementPhotos:(UIViewController *)vc{
    PHAuthorizationStatus author = [PHPhotoLibrary authorizationStatus];
    if (author == PHAuthorizationStatusRestricted || author == PHAuthorizationStatusDenied)
    {
        UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"允许“龙巅鱼邻”在你使用APP时访问你的相册？" message:@"否则将无法使用系统相册中图片发布图文帖和长贴，以及商品图片"
                                                             preferredStyle:UIAlertControllerStyleAlert];
        [aC addAction:[UIAlertAction actionWithTitle:@"去开启"
                                               style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction * _Nonnull action) {
                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                                 
                                             }]];
        [aC addAction:[UIAlertAction actionWithTitle:@"知道了"
                                               style:UIAlertActionStyleCancel
                                             handler:^(UIAlertAction * _Nonnull action) {}]];
        [vc presentViewController:aC animated:YES completion:NULL];
        
        return NO;
    }else if (author == PHAuthorizationStatusNotDetermined) {
        //没有询问是否开启相册
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status != PHAuthorizationStatusAuthorized) {
                UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"提示" message:@"若您未允许使用相册则后续部分功能将出现不可预测的情况" preferredStyle:UIAlertControllerStyleAlert];
                [aC addAction:[UIAlertAction actionWithTitle:@"知道了"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * _Nonnull action) {}]];
                [vc presentViewController:aC animated:YES completion:NULL];
            }
        }];
        
        return NO;
    }else {
        //玩家授权
        return YES;
    }
}

+(BOOL)judgementMicphone:(UIViewController *)vc {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        //未授权，家长限制     玩家未授权
        UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"允许“龙巅鱼邻”在你使用APP时访问你的麦克风？" message:@"否则将无法在录制视频时录制声音"
                                                             preferredStyle:UIAlertControllerStyleAlert];
        [aC addAction:[UIAlertAction actionWithTitle:@"去开启"
                                               style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction * _Nonnull action) {
                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                                 
                                             }]];
        [aC addAction:[UIAlertAction actionWithTitle:@"知道了"
                                               style:UIAlertActionStyleCancel
                                             handler:^(UIAlertAction * _Nonnull action) {}]];
        [vc presentViewController:aC animated:YES completion:NULL];
        
        return NO;
    }else if (authStatus == AVAuthorizationStatusNotDetermined) {
        //没有询问是否开启麦克风
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            if (!granted) {
                UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"提示" message:@"若您未允许使用麦克风则后续部分功能将出现不可预测的情况" preferredStyle:UIAlertControllerStyleAlert];
                [aC addAction:[UIAlertAction actionWithTitle:@"知道了"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * _Nonnull action) {}]];
                [vc presentViewController:aC animated:YES completion:NULL];
            }
        }];
        
        return NO;
    }else {
        //玩家授权
        return YES;
    }
}

//判断是否有定位权限
+(BOOL)judgementlocationServices:(UIViewController *)vc{
    
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {
        NSLog(@"定位功能可用");
        return YES;
        
    }else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted){ NSLog(@"定位功能不可用，提示用户或忽略");
        
        UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"允许“龙巅鱼邻”在你使用APP时访问你的位置？" message:@"否则将无法使用附近门店功能"
                                                             preferredStyle:UIAlertControllerStyleAlert];
        [aC addAction:[UIAlertAction actionWithTitle:@"去开启"
                                               style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction * _Nonnull action) {
                                                 NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
                                                 
                                                 if( [[UIApplication sharedApplication] canOpenURL:url]) {
                                                     
                                                     [[UIApplication sharedApplication] openURL:url];
                                                     
                                                 }
                                                 
                                             }]];
        [aC addAction:[UIAlertAction actionWithTitle:@"知道了"
                                               style:UIAlertActionStyleCancel
                                             handler:^(UIAlertAction * _Nonnull action) {}]];
        [vc presentViewController:aC animated:YES completion:NULL];
        
        
        return NO;
    }
    return NO;
    
}

+(CGSize)calculateTextHeightWithText:(NSString *)textString Width:(CGFloat)width height:(CGFloat)height font:(CGFloat)font{
    CGSize size = [textString boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
}

+ (NSString *)stringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

//输入的日期字符串形如：@"1992-05-21 13:08:08"
+ (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

#pragma mark 将时间转换为具体格式的方法
+(NSString *)ly_timeFormatted:(NSUInteger)totalSeconds{
    
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    NSString* loc=[NSString stringWithFormat:@"%@",localeDate];
    
    //    NSArray* dataArr1=[loc componentsSeparatedByString:@" "];
    //
    //    NSArray* dataArr2=[dataArr1[0] componentsSeparatedByString:@"-"];
    //
    //    NSString* locationData=[dataArr2 componentsJoinedByString:@"/"];
    
    NSString* locationData = [loc substringToIndex:19];
    
    return locationData;
}

//+(BOOL)ly_judgementDeviceIsJailBroken{
//    
//    return [self isJailBreak1] || [self isJailBreak2] || [self isJailBreak3];
//}

//+ (BOOL)isJailBreak1
//{
//    for (int i=0; i<ARRAY_SIZE(jailbreak_tool_pathes); i++) {
//        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_tool_pathes[i]]]) {
//            DebugLog(@"The device is jail broken!");
//            return YES;
//        }
//    }
//    DebugLog(@"The device is NOT jail broken!");
//    return NO;
//}

+ (BOOL)isJailBreak2
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        DebugLog(@"The device is jail broken!");
        return YES;
    }
    DebugLog(@"The device is NOT jail broken!");
    return NO;
}

+ (BOOL)isJailBreak3
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:USER_APP_PATH]) {
        DebugLog(@"The device is jail broken!");
        NSArray *applist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:USER_APP_PATH error:nil];
        DebugLog(@"applist = %@", applist);
        return YES;
    }
    DebugLog(@"The device is NOT jail broken!");
    return NO;
}

+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber{
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:phoneNumber];
    BOOL res2 = [regextestcm evaluateWithObject:phoneNumber];
    BOOL res3 = [regextestcu evaluateWithObject:phoneNumber];
    BOOL res4 = [regextestct evaluateWithObject:phoneNumber];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isUserNotificationEnable {
    // 判断用户是否允许接收通知
    BOOL isEnable = NO;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f) {
        // iOS版本 >=8.0 处理逻辑
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
        
    } else {
        // iOS版本 <8.0 处理逻辑
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        isEnable = (UIRemoteNotificationTypeNone == type) ? NO : YES; }
    return isEnable;
    
}

// 如果用户关闭了接收通知功能，该方法可以跳转到APP设置页面进行修改 iOS版本 >=8.0 处理逻辑
+ (void)goToAppSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([application canOpenURL:url]) {
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:url options:@{} completionHandler:nil];
            
        } else {
            [application openURL:url];
            
        }
        
    }
}

@end
