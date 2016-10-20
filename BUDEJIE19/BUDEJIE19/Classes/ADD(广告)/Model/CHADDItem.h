//
//  CHADDItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/18.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHADDItem : NSObject

//ori_curl w_picurl  w  h
/**图片链接*/
@property (nonatomic, strong)NSString *ori_curl;
/**图片URL*/
@property (nonatomic, strong)NSString *w_picurl;
/**图片的宽*/
@property (nonatomic, assign)CGFloat w;
/**图片的高*/
@property (nonatomic, assign)CGFloat h;


@end
