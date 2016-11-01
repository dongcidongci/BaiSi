//
//  CHRightCell.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/31.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHUserItem;
@interface CHRightCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, strong)CHUserItem *userItem;
/**创建CHTagCell*/
+ (instancetype)userCell;
@end
