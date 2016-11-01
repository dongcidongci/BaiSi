//
//  CHAllTopicTopView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHAllTopicTopView.h"
#import "CHAllItem.h"

#import <UIImageView+WebCache.h>
#import "NSDate+CHFormatter.h"

@interface CHAllTopicTopView ()
@property (weak, nonatomic) IBOutlet UIImageView *profile_image;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creat_timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end
@implementation CHAllTopicTopView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (void)setAllItem:(CHAllItem *)allItem{
    //因为是继承过来的类,所以父类的方法不能直接覆盖,要调super,再做自己独有的处理
    [super setAllItem:allItem];
    [self.profile_image sd_setImageWithURL:[NSURL URLWithString:allItem.profile_image]];
    self.nameLabel.text = allItem.name;
    self.creat_timeLabel.text = [self remakeCreateTime:allItem.create_time];
    self.textLabel.text = allItem.text;
    
}
#pragma mark - 重新组合帖子的创建时间
- (NSString *)remakeCreateTime:(NSString *)time{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *creatTime = [formatter dateFromString:time];
    if ([creatTime isThisYear]) {
        //今年
        if ([creatTime isThisToday]) {
            //今天
            NSDateComponents *comts = [creatTime timeIntervalSinceDate];
            if (comts.hour >= 1) {
                
                //1小时前
               NSInteger hh = comts.hour;
                return [NSString stringWithFormat:@"%ld小时前", hh];
            }else if (comts.minute >= 1){
                //1分钟前
                NSInteger mm = comts.minute ;
                return [NSString stringWithFormat:@"%ld分前", mm];
                
            }else{
                //刚刚
                return @"刚刚";
            }
            
        }else if ([creatTime isThisYesterday]){
            
            //昨天 ->昨天 14:00
            formatter.dateFormat = @"昨天 hh:mm";
            NSString *text = [formatter stringFromDate:creatTime];
            return text;
        }else{
            //昨天之前-> 10-26 11:10:01
            
            formatter.dateFormat = @"MM-dd hh:mm";
            NSString *text = [formatter stringFromDate:creatTime];
            return text;
        }
        
    }else{
    //非今年 2015-08-16 04:50:40
        return time;
    }

}
- (IBAction)moreBtnClick:(UIButton *)sender {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"关注" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"投诉" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:action];
    [alertC addAction:action1];
    [alertC addAction:action2];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:nil];
    
}


@end
