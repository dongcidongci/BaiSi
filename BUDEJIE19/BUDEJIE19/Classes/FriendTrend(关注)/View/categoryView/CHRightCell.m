//
//  CHRightCell.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/31.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHRightCell.h"
#import "CHUserItem.h"
#import <UIImageView+WebCache.h>

@interface CHRightCell ()

@property (weak, nonatomic) IBOutlet UILabel *screen_nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *fanCountLabel;

@end
@implementation CHRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImageV.layer.cornerRadius = self.iconImageV.width * 0.5;
    self.iconImageV.layer.masksToBounds = YES;
    
}
+ (instancetype)userCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"CHTagCell" owner:nil options:nil] lastObject];
}


- (void)setUserItem:(CHUserItem *)userItem{
    _userItem = userItem;
    //NSLog(@"名称%@", userItem.screen_name);
    self.screen_nameLabel.text = userItem.screen_name;
    NSInteger numbers = [userItem.fans_count integerValue];
    NSString *str = nil;
    if (numbers > 10000) {
        CGFloat nums = numbers / 10000.0;
        str = [NSString stringWithFormat:@"%.1lf万",nums];
    }else{
        str = [NSString stringWithFormat:@"%ld",numbers];
    }
    if([str containsString:@".0"]){
        str = [str stringByReplacingOccurrencesOfString:@".0" withString:@""];
    };
    self.fanCountLabel.text = str;
    [self.iconImageV sd_setImageWithURL:[NSURL URLWithString:userItem.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}


@end
