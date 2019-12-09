//
//  AppImageManager.m
//  SandboxImage
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "AppImageManager.h"
#import "SkinChangeManagerInterface.h"
#import "SkinChangeOutgoing.h"

@implementation AppImageManager

#pragma mark - 换肤图片
+ (void)getSkinImage:(NSString *)imageName
            resultBlock:(void(^)(UIImage *image))resultBlock
{
    
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    //从沙盒Images 文件下查找
    NSString *imageDir = [manager getSkinImagePath];
    UIImage *image = [self p_getSKinImage:imageDir imageName:imageName];
    if (image) {
        if (resultBlock) {
            resultBlock(image);
        }
        return;
    }
    //从NSBudle文件夹下查找
    NSBundle *bundle = [manager getCurrentBundle];
    image = [self p_getBundleImage:bundle imageName:imageName];
    if (image) {
        if (resultBlock) {
            resultBlock(image);
        }
        return;
    }
    //从主Bundle 中查找
    image = [UIImage imageNamed:imageName];
    if (image) {
        if (resultBlock) {
            resultBlock(image);
        }
    }
}

+ (UIImage *)p_getSKinImage:(NSString *)imageDir imageName:(NSString *)imageName {
    NSString *imagePath = [imageDir stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:imagePath];
}

+ (UIImage *)p_getBundleImage:(NSBundle *)bundle imageName:(NSString *)imageName {
    return [UIImage imageNamed:imageName
                      inBundle:bundle
   compatibleWithTraitCollection:nil];
}


@end
