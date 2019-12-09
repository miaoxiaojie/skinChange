//
//  SkinChangeManagerInterface.h
//  skinChange
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SkinChangeTonalInterface;

NS_ASSUME_NONNULL_BEGIN

// 色调的皮肤类型
typedef NS_ENUM(NSInteger, TonalSkinType) {
    TonalSkinNone = -1,
    TonalSkinNormalColor = 0,
    TonalSkinPurpleColor = 1,//紫色
    TonalSkinOrangeColor = 2,
    TonalSkinRedColor = 3,
    
};

@protocol SkinChangeManagerInterface <NSObject>

/**
 获取皮肤保存路径base目录/Cache/Skins

 @return Library/Caches/Skins
 */
- (NSString *)getSkinBasePath;

/**
 获取根路径的目录

 @return .../Library/Caches/Skins/Sandbox
 */
- (NSString *)getAppSkinBasePath:(TonalSkinType)type;

/**
 获取图片的路径

 @return .../Library/Caches/Skins/Sandbox/Sandbox/Images
 */
- (NSString *)getSkinImagePath;

/**
 获得当前的bundel

 @return bundle
 */
- (NSBundle *)getCurrentBundle;

#pragma mark - 颜色

/**
 获取文件的路径

 @return /Library/Caches/Skins/Sandbox/Sandbox/Color
 */
- (NSString *)getColorInfoFilePath;

/**
 获取颜色

 @param key 颜色Key
 @return 颜色
 */
- (NSString *)getColorStringForKey:(NSString *)key;


/**
 设置当前的色调的类型

 @param type 类型
 */
- (void)setCurrentSkinType:(TonalSkinType)type;

/**
获得当前色调的类型

 @return 类型
 */
- (TonalSkinType)getCurrentSkinType;


/**
 添加换肤的通知

 @param observer 通知
 */
- (void)addSkinChangeObserver:(id<SkinChangeTonalInterface>)observer;

/**
 移除通知

 @param observer 通知
 */
- (void)removeSkinChangeObserver:(id<SkinChangeTonalInterface>)observer;

/**
 发送换肤的通知
 */
- (void)postSkinChangeNotification;

@end

NS_ASSUME_NONNULL_END
