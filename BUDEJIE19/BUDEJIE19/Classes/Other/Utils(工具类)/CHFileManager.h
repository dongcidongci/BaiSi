//
//  CHFileManager.h
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/23.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

/**对文件夹的操作*/
@interface CHFileManager : NSObject

/**把指定目录下的文件大小,按单位换算成字符串
 *path :文件夹路径
 *completion:完成换算后的回调
 */
+ (void)stringFromDirectorySizeAtPath:(NSString *)path completion:(void(^)(NSString * text)) completion;

/**计算指定目录下的文件夹下文件大小(不包含其子文件夹下的文件大小)
 *path :文件夹路径
 *completion:完成换算后的回调
 */
+ (void)directorySizeAtPath:(NSString *)path completion:(void(^)(NSInteger size))completion;
/**删除文件夹目录下的所有文件,并创建一个文件夹*/
+ (void)deleteStatuseAtPath:(NSString *)path;
@end
