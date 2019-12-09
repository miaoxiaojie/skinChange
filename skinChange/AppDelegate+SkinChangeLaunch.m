//
//  AppDelegate+SkinChangeLaunch.m
//  skinChange
//
//  Created by miao on 2019/12/5.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "AppDelegate+SkinChangeLaunch.h"
#import "RunTimeUtil.h"
#import "SkinChangeManagerInterface.h"
#import "SkinChangeOutgoing.h"
#import "SkinChangeNormalModelInterface.h"
#import "FileUtil.h"
#import "ZipUtil.h"

@implementation AppDelegate (SkinChangeLaunch)

+ (void)load
{
    //启动程序时初始化
    runTimeUtil.transforInstanceMethod_cmbc([self class],
                                            @selector(application:didFinishLaunchingWithOptions:),
                                            @selector(p_managementOfResourceFiles));
}


- (void)p_managementOfResourceFiles
{
    [self p_managementOfResourceFiles];
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    NSString *basePath = [manager getSkinBasePath];
    if (![FileUtil fileExistAtPath:basePath]) {
        [self p_createFiles];
        [self p_copyFiles];
        
    }
}

- (void)p_copyFiles
{
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    id<SkinChangeNormalModelInterface> normalModel = [SkinChangeOutgoing getSkinChangeModel:TonalSkinNormalColor];
    //拷贝目录
    NSString *zipSandbox = [NSString stringWithFormat:@"%@.zip",[normalModel getZipFileName]];
    //skinChange.app/Sandbox.zip
    NSString *zipFromSandbox = [[NSBundle mainBundle] pathForResource:zipSandbox ofType:nil];
    //Library/Caches/Skins/Sandbox/Sandbox.zip
    NSString *zipToSandbox = [[manager getAppSkinBasePath:TonalSkinNormalColor]stringByAppendingPathComponent:zipSandbox];
    [FileUtil fileCopy:zipFromSandbox toPath:zipToSandbox];
    NSString *dirPath = [manager getAppSkinBasePath:TonalSkinNormalColor];
    [ZipUtil unArchiveZipWithName:zipSandbox dirPath:dirPath];
    //删除沙盒的zip包
    [FileUtil fileDel:zipToSandbox];
    
    //拷贝紫色皮肤包
    id<SkinChangeNormalModelInterface> purpleModel = [SkinChangeOutgoing getSkinChangeModel:TonalSkinPurpleColor];
    //拷贝目录
    NSString *zipPurple = [NSString stringWithFormat:@"%@.zip",[purpleModel getZipFileName]];
    //skinChange.app/Sandbox.zip
    NSString *zipFromPurple = [[NSBundle mainBundle] pathForResource:zipPurple ofType:nil];
    //Library/Caches/Skins/Sandbox/Sandbox.zip
    NSString *zipToPurple = [[manager getAppSkinBasePath:TonalSkinPurpleColor]stringByAppendingPathComponent:zipPurple];
    [FileUtil fileCopy:zipFromPurple toPath:zipToPurple];
    NSString *dirPathPurple = [manager getAppSkinBasePath:TonalSkinPurpleColor];
    [ZipUtil unArchiveZipWithName:zipPurple dirPath:dirPathPurple];
    //删除沙盒的zip包
    [FileUtil fileDel:zipToPurple];
    
    //拷贝橘色皮肤包
    id<SkinChangeNormalModelInterface> OrangeModel = [SkinChangeOutgoing getSkinChangeModel:TonalSkinOrangeColor];
    //拷贝目录
    NSString *zipOrange = [NSString stringWithFormat:@"%@.zip",[OrangeModel getZipFileName]];
    //skinChange.app/Sandbox.zip
    NSString *zipFromOrange = [[NSBundle mainBundle] pathForResource:zipOrange ofType:nil];
    //Library/Caches/Skins/Sandbox/Sandbox.zip
    NSString *zipToOrange = [[manager getAppSkinBasePath:TonalSkinOrangeColor]stringByAppendingPathComponent:zipOrange];
    [FileUtil fileCopy:zipFromOrange toPath:zipToOrange];
    NSString *dirPathOrange = [manager getAppSkinBasePath:TonalSkinOrangeColor];
    [ZipUtil unArchiveZipWithName:zipOrange dirPath:dirPathOrange];
    //删除沙盒的zip包
    [FileUtil fileDel:zipToOrange];
    
    //拷贝红色皮肤包
    id<SkinChangeNormalModelInterface> redModel = [SkinChangeOutgoing getSkinChangeModel:TonalSkinRedColor];
    //拷贝目录
    NSString *zipRed = [NSString stringWithFormat:@"%@.zip",[redModel getZipFileName]];
    //skinChange.app/Sandbox.zip
    NSString *zipFromRed = [[NSBundle mainBundle] pathForResource:zipRed ofType:nil];
    //Library/Caches/Skins/Sandbox/Sandbox.zip
    NSString *zipToRed = [[manager getAppSkinBasePath:TonalSkinRedColor]stringByAppendingPathComponent:zipRed];
    [FileUtil fileCopy:zipFromRed toPath:zipToRed];
    NSString *dirPathRed = [manager getAppSkinBasePath:TonalSkinRedColor];
    [ZipUtil unArchiveZipWithName:zipRed dirPath:dirPathRed];
    //删除沙盒的zip包
    [FileUtil fileDel:zipToRed];
    /*
     注意点：解压后一定要删除zip包
     */
    
}

- (void)p_createFiles
{
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    NSString *basePath = [manager getSkinBasePath];
    //创建根目录
    [FileUtil fileCreateDir:basePath];
    
    //创建普通目录
    [FileUtil fileCreateDir:[manager getAppSkinBasePath:TonalSkinNormalColor]];
    //紫色
    [FileUtil fileCreateDir:[manager getAppSkinBasePath:TonalSkinPurpleColor]];
    //橘色
    [FileUtil fileCreateDir:[manager getAppSkinBasePath:TonalSkinOrangeColor]];
    //红色
    [FileUtil fileCreateDir:[manager getAppSkinBasePath:TonalSkinRedColor]];
}



@end
