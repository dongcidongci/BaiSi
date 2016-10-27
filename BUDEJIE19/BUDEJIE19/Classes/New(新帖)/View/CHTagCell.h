//
//  CHTagCell.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHTagItem;

@interface CHTagCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, strong)CHTagItem *tagItem;
/**创建CHTagCell*/
+ (instancetype)tagCell;
@end
