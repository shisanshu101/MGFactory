//
//  LDTimerAction.m
//  YuLin
//
//  Created by ml on 2017/3/5.
//  Copyright © 2017年 zhishi. All rights reserved.
//

#import "LDTimerAction.h"
#import "LDTimerModel.h"

@implementation LDTimerAction

//saveTimerSp:传入缓存中保存到时间戳  inputHours:输入执行操作的间隔时间
+(BOOL)isTimerPeriodActionWithTimerSP:(NSString *)saveTimerSp withinputHours:(float)inputHours{
    
    
    NSDate *datenow = [NSDate date];
    NSString *dataString = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];

    NSInteger second = (NSInteger)(inputHours*3600);
    
    NSInteger sum = [saveTimerSp integerValue] + second;
    
    if (sum < [dataString integerValue]) {
        return YES;
    }else{
        return NO;
    }
}

+(NSString *)getCurrentTimeStamp{
    NSDate *datenow = [NSDate date];
    NSString *dataString = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return dataString;
}



//获取时间戳后转换为今天，明天，后天的某一个时间点
+(NSString *)getTimerPoint:(NSString *)timeStr{
    NSString *dayStr;
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSDate *zeronow = [self zeroOfDate];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[zeronow timeIntervalSince1970]];
    
    NSInteger diffDay = ([timeStr integerValue] - [timeSp integerValue])/(3600*24);
    
    if ([timeStr integerValue] > [timeSp integerValue]) {
        if (diffDay == 0) {
            dayStr = @"今天";
        }else if (diffDay == 1){
            dayStr = @"明天";
        }else if (diffDay == 2){
            dayStr = @"后天";
        }else {
            dayStr = [NSString stringWithFormat:@"%ld天后",diffDay];
        }
    }else{
        diffDay = 0;
        dayStr = @"今天";
    }
    
    
    [formatter setDateFormat:@"HH:mm"];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStr integerValue]];
    NSString *dateString = [formatter stringFromDate:date];
    
    NSString *allDateStr = [NSString stringWithFormat:@"%@%@",dayStr,dateString];
    
    return allDateStr;

}

+ (NSDate *)zeroOfDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *datenow = [NSDate date];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:datenow];
    
    components.hour = 0;
    
    components.minute = 0;
    
    components.second = 0;
    
    NSTimeInterval ts = (double)(int)[[calendar dateFromComponents:components] timeIntervalSince1970];
    
    return [NSDate dateWithTimeIntervalSince1970:ts];
}


+ (NSString *)stringWithTimelineDate:(NSDate *)date {
    if (!date) return @"";
    
    static NSDateFormatter *formatterYesterday;
    static NSDateFormatter *formatterSameYear;
    static NSDateFormatter *formatterFullDate;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatterYesterday = [[NSDateFormatter alloc] init];
        [formatterYesterday setDateFormat:@"昨天 HH:mm"];
        [formatterYesterday setLocale:[NSLocale currentLocale]];
        
        formatterSameYear = [[NSDateFormatter alloc] init];
        [formatterSameYear setDateFormat:@"MM-dd"];
        [formatterSameYear setLocale:[NSLocale currentLocale]];
        
        formatterFullDate = [[NSDateFormatter alloc] init];
        [formatterFullDate setDateFormat:@"yyyy-MM-dd"];
        [formatterFullDate setLocale:[NSLocale currentLocale]];
    });
    
    NSDate *now = [NSDate new];
    NSTimeInterval delta = now.timeIntervalSince1970 - date.timeIntervalSince1970;
    if (delta < -60 * 10) { // 本地时间有问题
        return [formatterFullDate stringFromDate:date];
    } else if (delta < 60 * 10) { // 10分钟内
        return @"刚刚";
    } else if (delta < 60 * 60) { // 1小时内
        return [NSString stringWithFormat:@"%d分钟前", (int)(delta / 60.0)];
    } else if (date.isToday) {
        return [NSString stringWithFormat:@"%d小时前", (int)(delta / 60.0 / 60.0)];
    } else if (date.isYesterday) {
        return [formatterYesterday stringFromDate:date];
    } else if (date.year == now.year) {
        return [formatterSameYear stringFromDate:date];
    } else {
        return [formatterFullDate stringFromDate:date];
    }
}

+(LDTimerModel *)currentDateToModel{
    // 获取代表公历的NSCalendar对象
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 获取当前日期
    NSDate* dt = [NSDate date];
    // 定义一个时间字段的旗标，指定将会获取指定年、月、日、时、分、秒的信息
    unsigned unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |  NSCalendarUnitDay |
    NSCalendarUnitHour |  NSCalendarUnitMinute |
    NSCalendarUnitSecond | NSCalendarUnitWeekday;
    // 获取不同时间字段的信息
    NSDateComponents* comp = [gregorian components: unitFlags
                                          fromDate:dt];
   
    LDTimerModel *model = [LDTimerModel new];
    
    model.year = comp.year;
    model.month = comp.month;
    model.day = comp.day;
    model.hour = comp.hour;
    model.minute = comp.minute;
    model.second = comp.second;
    model.weekday = comp.weekday;
    return model;
}

//传入时间戳，获取具体的时间模型
+(LDTimerModel *)dateToModelWithTimeStr:(NSString *)timeStr{
    
    NSDate *dt = [NSDate dateWithTimeIntervalSince1970:[timeStr integerValue]];
    
    // 获取代表公历的NSCalendar对象
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 定义一个时间字段的旗标，指定将会获取指定年、月、日、时、分、秒的信息
    unsigned unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |  NSCalendarUnitDay |
    NSCalendarUnitHour |  NSCalendarUnitMinute |
    NSCalendarUnitSecond | NSCalendarUnitWeekday;
    // 获取不同时间字段的信息
    NSDateComponents* comp = [gregorian components: unitFlags
                                          fromDate:dt];
    
    LDTimerModel *model = [LDTimerModel new];
    
    model.year = comp.year;
    model.month = comp.month;
    model.day = comp.day;
    model.hour = comp.hour;
    model.minute = comp.minute;
    model.second = comp.second;
    model.weekday = comp.weekday;
    return model;
}



#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format]; //(@"yyyy-MM-dd hh:mm:ss GTM") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制


    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
    
}


#pragma mark - 将某个时间戳转化成 时间

+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format]; // （@"yyyy-MM-dd hh:mm:ss "）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSLog(@"1296035591  = %@",confromTimesp);

    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
    
}

#pragma mark - 处理时间轴的数据
+(NSString *)getTimerLineDate:(NSString *)timeStr{
    NSString *dayStr;
    
    NSString *currentTimeStr = [self getCurrentTimeStamp];
    
    LDTimerModel *currentModel = [self dateToModelWithTimeStr:currentTimeStr];
    LDTimerModel *pubModel = [self dateToModelWithTimeStr:timeStr];
    
    if (currentModel.year == pubModel.year && currentModel.month == pubModel.month) {
        if (currentModel.day - pubModel.day == 0) {
            dayStr = @"今天";
        }else if (currentModel.day - pubModel.day == 1){
             dayStr = @"昨天";
        }
    }

    return dayStr;
    
}

+(NSString *)showTimeTextAcitonWithStartTime : (NSInteger)startTime withEndTime:(NSInteger)endTime{
    NSInteger secondsCountDown = endTime - startTime;
    NSString *str_hours = [NSString stringWithFormat:@"%02ld", (secondsCountDown /3600)];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld", (secondsCountDown % 3600 / 60)];
    NSString *str_second = [NSString stringWithFormat:@"%02ld", secondsCountDown % 60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@", str_hours,str_minute,str_second];
    return format_time;
}



@end
