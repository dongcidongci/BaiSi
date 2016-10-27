//
//  NSDate+CHFormatter.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/26.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CHFormator)
/**是不是今年*/
- (BOOL)isThisYear;
/**是不是今天之内*/
- (BOOL)isThisToday;
/**是不是昨天*/
- (BOOL)isThisYesterday;
/**获取指定时间距离现在的 时和分*/
- (NSDateComponents *)timeIntervalSinceDate;
@end
