//
//  LDTimerAction.h
//  YuLin
//
//  Created by ml on 2017/3/5.
//  Copyright © 2017年 zhishi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LDTimerModel;

@interface LDTimerAction : NSObject

/**
 判断是否在时间范围内，进行对应的操作
 */
+(BOOL)isTimerPeriodActionWithTimerSP:(NSString *)saveTimerSp withinputHours:(float)inputHours;


/**
获取当前时间的时间戳
*/
+(NSString *)getCurrentTimeStamp;


//获取时间戳后转换为今天，明天，后天的某一个时间点
+(NSString *)getTimerPoint:(NSString *)timeStr;

/// 最新的发布时间转换方法
+ (NSString *)stringWithTimelineDate:(NSDate *)date;

//传入时间戳，获取具体的时间模型
+(LDTimerModel *)dateToModelWithTimeStr:(NSString *)timeStr;

//获取当前的年月日时分秒
+(LDTimerModel *)currentDateToModel;

#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

#pragma mark - 将某个时间戳转化成 时间

+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;


#pragma mark - 处理时间轴的数据
+(NSString *)getTimerLineDate:(NSString *)timeStr;

#pragma mark - 处理两个时间戳之间的差值转换为时分秒
+(NSString *)showTimeTextAcitonWithStartTime : (NSInteger)startTime withEndTime:(NSInteger)endTime;

@end


