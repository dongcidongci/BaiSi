//
//  CHPhotoTopicView.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/25.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHBigPhotoViewController.h"
#import "CHPhotoTopicView.h"
#import <UIImageView+WebCache.h>
#import "CHAllItem.h"
#import "CHDrawView.h"

@interface CHPhotoTopicView ()
/**进度提示*/
@property (weak, nonatomic) IBOutlet CHDrawView *progressView;
/**图片内容控件*/
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
/**看大图的按钮*/
@property (weak, nonatomic) IBOutlet UIButton *bigPhotoBtn;
/**是不是gif图片的标志*/
@property (weak, nonatomic) IBOutlet UIImageView *isGifImageView;


@end
@implementation CHPhotoTopicView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CHBigPhotoViewController *bigPhotoVC = [[CHBigPhotoViewController alloc] init];
    bigPhotoVC.allItem = self.allItem;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:bigPhotoVC animated:YES completion:nil];
}

#pragma mark - 监听 看大图 的按钮点击事件
- (IBAction)seeBigPictureBtnClick:(UIButton *)sender {
    CHBigPhotoViewController *bigPhotoVC = [[CHBigPhotoViewController alloc] init];
    bigPhotoVC.allItem = self.allItem;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:bigPhotoVC animated:YES completion:nil];
    //NSLog(@"点击了看大图按钮");
}
#pragma mark - 重写父类的设置模型方法
- (void)setAllItem:(CHAllItem *)allItem{
    [super setAllItem:allItem];
    if (allItem.is_gif) {
        self.isGifImageView.hidden = NO;
    }else{
        self.isGifImageView.hidden = YES;
    }
    if (allItem.isBigPhoto) {
        self.bigPhotoBtn.hidden = NO;
        self.photoImageView.contentMode = UIViewContentModeTop;
        self.photoImageView.clipsToBounds = YES;
    }else{
        self.bigPhotoBtn.hidden = YES;
        self.photoImageView.contentMode = UIViewContentModeScaleToFill;
        self.photoImageView.clipsToBounds = NO;
    }
    //拼接沙盒路径
    NSURL *url = [NSURL URLWithString:allItem.image0];
    //图片的全路径
    NSString *fullPath =[CachePath stringByAppendingPathComponent:[url lastPathComponent]];
    NSData *dataCache = [NSData dataWithContentsOfFile:fullPath];
    UIImage *imageCache = [UIImage imageWithData:dataCache];
    if (imageCache) {
        self.photoImageView.image = imageCache;
        //把沙盒的图片保存一份到内存缓存
        allItem.bigImage = imageCache;
    }else{
    //最新的框架中这个方法是没有回到主线程的,所以我们自己要回到主线程刷新界面
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:allItem.image0] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    //当前用的不是最新的框架版本
        if (expectedSize > 0) {
            self.progressView.progress = 1.0 * receivedSize / expectedSize;

        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //如果图片小于15000,就什么都不做
        if (self.allItem.height < 15000) return ;
        //把不能显示的图片,画上去显示
        //开启位图上下文(20是2倍margin)
        CGFloat w = CHSCREENW - 20;
        CGFloat h = w / self.allItem.width * self.allItem.height;
        UIGraphicsBeginImageContext(CGSizeMake(w, h));
        //把图片画上去
        [image drawInRect:CGRectMake(0, 0, w, h)];
        //生成图片
        image = UIGraphicsGetImageFromCurrentImageContext();
        //关闭位图上下文
        UIGraphicsEndImageContext();
        self.photoImageView.image = image;
        //把画好的图片保存一份到内存缓存
        allItem.bigImage = image;
        
        NSData *data = UIImagePNGRepresentation(image);
        [data writeToFile:fullPath atomically:YES];
       // NSLog(@"沙盒路径%@, 全路径%@",CachePath, fullPath );
        
    }];
    }
    
}
@end
