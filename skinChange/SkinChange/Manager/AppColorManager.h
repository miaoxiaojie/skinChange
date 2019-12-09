//
//  AppColorManager.h
//  skinChange
//
//  Created by miao on 2019/11/27.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppColorManager : NSObject

+ (NSString *)getTianMaoIconColorKey:(NSString *)key;

+ (UIColor *)getTitleColorKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
