//
//  CHLoginRegistTField.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHLoginRegistTField.h"

@implementation CHLoginRegistTField

- (void)awakeFromNib{
    
    //监听textField
    [self addTarget:self action:@selector(editBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editEnd) forControlEvents:UIControlEventEditingDidEnd];
}
//编辑开始的时候
- (void)editBegin{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dict];
}
//编辑结束
- (void)editEnd{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dict];
}

@end
