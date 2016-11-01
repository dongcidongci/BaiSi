//
//  CHAllItem.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CHTopCommentItem;
typedef enum : NSUInteger {
    kCHTopicTypeAll = 1,
    kCHTopicTypePhoto = 10,
    kCHTopicTypeVideo = 41,
    kCHTopicTypeVoice = 31,
    kCHTopicTypeText = 29
} CHTopicType;
@interface CHAllItem : NSObject

/**
 *基本信息
 */

/**头像*/
@property (nonatomic, strong)NSString *profile_image;
/**用户名*/
@property (nonatomic, strong)NSString *name;
/**发表时间*/
@property (nonatomic, strong)NSString *create_time;
/**内容*/
@property (nonatomic, strong)NSString *text;

/**
 *图片段子
 */
/**图片*/
@property (nonatomic, strong)NSString *image0;
/**是否是Gif图片*/
@property(nonatomic, assign)BOOL is_gif;
/**图片高度*/
@property(nonatomic, assign)CGFloat height;
/**图片宽度*/
@property(nonatomic, assign)CGFloat width;
/**是不是大图*/
@property(nonatomic, assign, getter=isBigPhoto)BOOL bigPhoto;
/**数据的类型枚举*/
@property(nonatomic, assign)CHTopicType type;
/**沙盒里面保存的大图片*/
@property (nonatomic, strong)UIImage *bigImage;

/**
 *音频段子
 */
/**音频的播放时间长度*/
@property (nonatomic, assign)NSInteger voicetime;
/**音频的url*/
@property (nonatomic, strong)NSString *voiceuri;
/**音频的被播放的次数*/
@property (nonatomic, assign)NSInteger voicelength;

/**
 *视频段子
 */

/**视频的播放时间长度*/
@property (nonatomic, assign)NSInteger videotime;
/**视频的url*/
@property (nonatomic, strong)NSString *videouri;
/**视频被播放的次数*/
@property (nonatomic, assign)NSInteger videolength;

/**
 *最热评论
 */
/**最热评论的字典数组(服务器返回的数组中只有一个item)*/
@property (nonatomic, strong)NSArray *top_cmt;
/**最热评论的模型*/
@property (nonatomic, strong)CHTopCommentItem *topCommentItem;

/**评论数(为了方便计算,直接把类型改为CGFloat,也是可以的)*/
@property (nonatomic, assign)CGFloat comment;
/**顶数*/
@property (nonatomic, assign)CGFloat ding;
/**踩数*/
@property (nonatomic, assign)CGFloat cai;
/**分享的次数*/
@property (nonatomic, assign)CGFloat repost;

@end
