//
//  CHView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHView.h"

@implementation CHView
- (void)drawRect:(CGRect)rect{
    UIImage *image = [UIImage imageNamed:@"navigationbarBackgroundWhite"];
    [image drawInRect:rect];
}
@end
