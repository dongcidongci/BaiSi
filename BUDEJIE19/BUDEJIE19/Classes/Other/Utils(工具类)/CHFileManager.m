//
//  CHFileManager.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/23.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHFileManager.h"

@implementation CHFileManager

+ (void)stringFromDirectorySizeAtPath:(NSString *)path completion:(void(^)(NSString * text)) completion{
    [CHFileManager directorySizeAtPath:path completion:^(NSInteger size) {
        
        CGFloat sizeFloat = 0;
        NSString *basicText = @"清除缓存";
        NSString *text = nil;
        //在手机的计算单位是1000的,而不是普遍认为的1024
        if (size > 1000 * 1000) {
            sizeFloat = size / 1000.0 / 1000.0;
            text =[NSString stringWithFormat:@"%@%0.1lfMB",basicText, sizeFloat];
        }else if (size > 1000){
            sizeFloat = size / 1000.0;
            text = [NSString stringWithFormat:@"%@%0.1lfMB",basicText, sizeFloat];
        }else if(size > 0){
            text = [NSString stringWithFormat:@"%@%ldB", basicText, size];
        }else if(size == 0){
            text = basicText;
        }
        [text stringByReplacingOccurrencesOfString:@".0" withString:@""];
        completion(text);
    }];
    
}
#pragma mark - 获取磁盘缓存文件的大小
+ (void)directorySizeAtPath:(NSString *)path completion:(void(^)(NSInteger size))completion{
    
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isDiretory = NO;
    //目录下是否有东西存在(文件/文件夹),假如存在,返回YES,追加判断,这个东西是不是文件夹,如果是,把isDirectory的值变为YES
    BOOL isExsists = [manager fileExistsAtPath:path isDirectory:&isDiretory];
    //不是文件夹或者不存在任何东西,就抛出异常
    if (!isDiretory || !isExsists) {
        @throw [NSException exceptionWithName:@"pathError" reason:@"传入的路径不是文件夹路径" userInfo:nil];
        
    }

    
    //获取沙盒路径下的文件路径(有可能是文件夹下面还有文件夹的)
    NSArray *array = [manager subpathsAtPath:path];
    //拼接文件的全路径
    //耗时操作,开子线程来执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSInteger totalySize = 0;
        for (NSString *subPath in array) {
            //NSString *fileName = [path lastPathComponent];
            NSString *fullPath = [path stringByAppendingPathComponent:subPath];
            //判断是不是隐藏文件夹
            if ([fullPath containsString:@".DS"]) {
                //返回,重新循环
                continue;
            }
            //判断是不是文件夹
            BOOL isDiretory = NO;
            //目录下是否有东西存在(文件/文件夹),假如存在,返回YES,追加判断,这个东西是不是文件夹,如果是,把isDirectory的值变为YES
            BOOL isExsists = [manager fileExistsAtPath:fullPath isDirectory:&isDiretory];
            //是文件夹或者不存在任何东西,就返回执行下一次循环
            if (isDiretory || !isExsists) {
                continue;
            }
            //遍历取出每个文件的文件大小
            NSDictionary *dict = [manager attributesOfItemAtPath:fullPath error:nil];
            //累加文件的大小
            totalySize += [dict fileSize];
        }
        //回到主线程刷新数据
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            //计算完成之后,把结果返回出去给调用者使用
            completion(totalySize);
        });
    });
    
    
    

}

//删除文件夹目录下的所有文件,并创建一个文件夹
+ (void)deleteStatuseAtPath:(NSString *)path{
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isDiretory = NO;
    //目录下是否有东西存在(文件/文件夹),假如存在,返回YES,追加判断,这个东西是不是文件夹,如果是,把isDirectory的值变为YES
    BOOL isExsists = [manager fileExistsAtPath:path isDirectory:&isDiretory];
    //不是文件夹或者不存在任何东西,就抛出异常
    if (!isDiretory || !isExsists) {
        @throw [NSException exceptionWithName:@"pathError" reason:@"传入的路径不是文件夹路径" userInfo:nil];
        
    }
    //删除文件夹
    [manager removeItemAtPath:path error:nil];
    //创建一个新的文件夹
    [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    
}
@end
