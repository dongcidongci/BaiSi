//
//  CHTagCell.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTagCell.h"

@interface CHTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;

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

@end
