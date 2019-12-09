//
//  SkinChangeModel.h
//  skinChange
//
//  Created by miao on 2019/12/4.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SkinChangeModel : NSObject

/**
 获得设置的数据

 @return 数组
 */
+ (NSArray <NSDictionary *>*)getSetUpData;

/**
 获得诗的文字

 @return 字符串
 */
+ (NSString *)getDynamicPoem;

/**
 获得首页icon 图片name

 @return 数组
 */
+ (NSArray *)getIconPictureNameList;

@end

NS_ASSUME_NONNULL_END
