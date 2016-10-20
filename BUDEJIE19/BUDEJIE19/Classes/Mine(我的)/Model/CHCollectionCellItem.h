//
//  CHCollectionCellItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCollectionCellItem : NSObject
/**主题*/
@property (nonatomic, strong)NSString *name;
/**图片*/
@property (nonatomic, strong)NSString *icon;
/**主题链接*/
@property (nonatomic, strong)NSString *url;
@end
