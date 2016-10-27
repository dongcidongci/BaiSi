//
//  CHTagCell.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTagCell.h"
#import "CHTagItem.h"
#import <UIImageView+WebCache.h>

@interface CHTagCell ()
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *readersLabel;

@end
@implementation CHTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 5;
    self.iconImageV.layer.cornerRadius = self.iconImageV.width*0.5;
    self.iconImageV.layer.masksToBounds = YES;
    
}
+ (instancetype)tagCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"CHTagCell" owner:nil options:nil] lastObject];
}

- (void)setFrame:(CGRect)frame{
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.origin.x += 10;
    frame.size.width -= 20;
    
    [super setFrame:frame];
}
- (void)setTagItem:(CHTagItem *)tagItem{
    _tagItem = tagItem;
    self.themeLabel.text = tagItem.theme_name;
    NSInteger numbers = [tagItem.sub_number integerValue];
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
    self.readersLabel.text = str;
    [self.iconImageV sd_setImageWithURL:[NSURL URLWithString:tagItem.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
@end
