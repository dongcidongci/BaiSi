//
//  CHLoginView.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHLoginView;
@protocol CHLoginViewDelegate <NSObject>

- (void)loginViewDidClosed:(CHLoginView *)loginView;


@end
@interface CHLoginView : UIView
/**代理属性 */
@property(weak, nonatomic) id <CHLoginViewDelegate>delegate;



/**快速创建对象*/
+ (instancetype)loginView;
@end
