//
//  CHBigPhotoViewController.m
//  BUDEJIE19
//
//  Created by moxuyou on 16/10/27.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHBigPhotoViewController.h"
#import "CHAllItem.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import <Photos/Photos.h>
@interface CHBigPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/**<#注释#> */
@property(weak, nonatomic) UIImageView *imageView;

@end

@implementation CHBigPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat height = CHSCREENW / self.allItem.width * self.allItem.height;
    //imageView.backgroundColor = [UIColor redColor];
    imageView.frame = CGRectMake(0, 0, CHSCREENW,height);
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.allItem.image0]];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    self.scrollView.contentSize = CGSizeMake(0, height);
    if (!self.allItem.isBigPhoto) {
        imageView.center = CGPointMake(CHSCREENW * 0.5, CHSCREENH * 0.5);
    }
    //self.imageView.image = self.bigImage;
    
}
#pragma mark - 返回
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 保存图片
- (IBAction)savePhoto:(UIButton *)sender {
    /*
     0.第一次保存照片时,显示提示框，询问用户是否允许当前App访问相册
     1.只需要创建一个新的相册
     */
    
    // 获取用户授权状态
    
    /*
     PHAuthorizationStatusNotDetermined = 0, 不确定
     PHAuthorizationStatusRestricted, 家长控制,拒绝
     PHAuthorizationStatusDenied, 拒绝
     PHAuthorizationStatusAuthorized 授权
     */
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    status = PHAuthorizationStatusAuthorized;
    if (status == PHAuthorizationStatusAuthorized) {
        [self savePhoto];
    }else{
        [SVProgressHUD showInfoWithStatus:@"拒绝访问相册,可以在手机'设置->百思->允许访问相册'更改权限"];
    }

   }
#pragma mark - 保存图片
- (void)savePhoto{
    //导入API,创建相簿单例对象(对相簿的所有操作,必须在performChanges:completionHandler:这个方法里面操作)
    PHPhotoLibrary *photoL = [PHPhotoLibrary sharedPhotoLibrary];
    [photoL performChanges:^{
        /***相簿中遍历相册,找到自己想要保存照片的相册(如果没有找到,就自己创建)***/
        PHAssetCollection *collection = [self enumAlbumForMyAssetCollection];
        PHAssetCollectionChangeRequest *changeRequest;
        if (collection) {
            //查到自己自定义过的相册,则根据相册,创建一个修改系统相册的请求
            changeRequest = [PHAssetCollectionChangeRequest  changeRequestForAssetCollection:collection];
        }else{
            //没有自己的自定义相册,则要自己创建一个相册,再根据相册创建请求
            changeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:@"百思不得姐"];
            
        }
        
        //保存图片到系统的相册
        PHAssetChangeRequest *assetChangeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image];
        //把已经保存到系统的相册,拷贝指针到自己的自定义的相册
        PHObjectPlaceholder *placeHolder = [assetChangeRequest placeholderForCreatedAsset];
        [changeRequest addAssets:@[placeHolder]];
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            [SVProgressHUD showInfoWithStatus:@"保存成功"];
        }else{
            [SVProgressHUD showInfoWithStatus:@"保存失败"];
            NSLog(@"%@",error);
        }
    }];

    
}
#pragma mark - 遍历系统相簿,查找自己指定名字的相册
- (PHAssetCollection *)enumAlbumForMyAssetCollection{
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in result) {
        if ([collection.localizedTitle isEqualToString:@"百思不得姐"]) {
            return collection;
            
        }
    }
    return nil;

}

@end
