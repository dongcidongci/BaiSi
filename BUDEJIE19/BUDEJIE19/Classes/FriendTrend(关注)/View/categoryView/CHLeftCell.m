//
//  CHLeftCell.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/31.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHLeftCell.h"

@interface CHLeftCell ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end
@implementation CHLeftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setItem:(CHCategoryItem *)item{
    _item = item;
    self.categoryLabel.text = item.name;
}
//取消选中的cell和正在被选中的cell,这个过程会来这个方法(重要)
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.redView.hidden = !selected;
    self.categoryLabel.textColor = selected?[UIColor redColor]:[UIColor blackColor];
}

- (void)setFrame:(CGRect)frame{
    
    frame.size.height -= 1;
    
    [super setFrame:frame];
}
@end
