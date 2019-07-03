//
//  Permission.h
//  FactoryProject
//
//  Created by 一只狗 on 2018/12/11.
//  Copyright © 2018 MingLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>

#define CYDIA_APP_PATH                "/Applications/Cydia.app"

#define USER_APP_PATH                 @"/User/Applications/"

#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])

//const char* jailbreak_tool_pathes[] = {
//    "/Applications/Cydia.app",
//    "/Library/MobileSubstrate/MobileSubstrate.dylib",
//    "/bin/bash",
//    "/usr/sbin/sshd",
//    "/etc/apt"
//};

@interface Permission : NSObject

/// 判断是否有相机权限
+(BOOL)judegmentCamera:(UIViewController *)vc;

/// 判断是否有相册权限
+(BOOL)judgementPhotos:(UIViewController *)vc;

/// 判断是否有麦克风权限
+(BOOL)judgementMicphone:(UIViewController *)vc;

//判断是否有定位权限
+(BOOL)judgementlocationServices:(UIViewController *)vc;

//计算字体的高度
+(CGSize)calculateTextHeightWithText:(NSString *)textString Width:(CGFloat)width height:(CGFloat)height font:(CGFloat)font;


+(NSString *)ly_timeFormatted:(NSUInteger)totalSeconds;


/**
 判断手机设备是否越狱
 
 @return yes-越狱  no-没有越狱
 */
+(BOOL)ly_judgementDeviceIsJailBroken;

#pragma mark 0.4.1删除无用类的时候发现APPUtils类里边只有这一个方法有用故移到这里将那个类删除
//验证手机号码合法性（正则）
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber;

+ (BOOL)isUserNotificationEnable;

+ (void)goToAppSystemSetting ;


@end
