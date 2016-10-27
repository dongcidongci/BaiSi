//
//  NSDate+CHFormatter.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/26.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "NSDate+CHFormatter.h"

@implementation NSDate (CHFormator)

- (BOOL)isThisYear{
    
    //NSFormatter *formatter = [[NSFormatter alloc] init];
    
    //NSDate *date = nil;
    
    //获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //获取指定时间的年份
   NSDateComponents *dateC = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDate *date_now = [NSDate date];
    NSDateComponents *date_now_C = [calendar components:NSCalendarUnitYear fromDate:date_now];
    if (dateC.year == date_now_C.year) {
        return YES;
    }else return NO;
}
- (BOOL)isThisToday{
    //获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar isDateInToday:self];
}
- (BOOL)isThisYesterday{
    //获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar isDateInYesterday:self];
}

- (NSDateComponents *)timeIntervalSinceDate{
    //获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
   return [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    
}


@end
