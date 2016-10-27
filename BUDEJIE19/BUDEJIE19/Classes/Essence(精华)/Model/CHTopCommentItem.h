//
//  CHTopCommentItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/26.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CHUserMessageItem;

typedef enum : NSUInteger {
    kCHCommentTypeVoice = 31,
    kCHCommentTypeText = 29,
    
} CHCommentType;
@interface CHTopCommentItem : NSObject
/**评论的内容(文本格式)*/
@property (nonatomic, strong)NSString *content;
/**用户信息模型(服务器返回的是字典,MJExtenssion会自动转模型成指定的模型保存)*/
@property (nonatomic, strong)CHUserMessageItem *user;
/**评论的格式(文字还是语音)*/
@property (nonatomic, assign)CHCommentType cmt_type;
/**语音的长度*/
@property (nonatomic, strong)NSString *voicetime;
/**语音的链接地址*/
@property (nonatomic, strong)NSString *voiceuri;


/**用户名+文本评论内容(为了方便显示整体内容而临时定义在模型里面的)*/
@property (nonatomic, strong)NSString *name_content;
@end
