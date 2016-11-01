//
//  CHUserItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/31.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHUserItem : NSObject
/**用户名*/
@property (nonatomic, strong)NSString *screen_name;
/**图标*/
@property (nonatomic, strong)NSString *header;
/**粉丝*/
@property (nonatomic, strong)NSString *fans_count;

@end
