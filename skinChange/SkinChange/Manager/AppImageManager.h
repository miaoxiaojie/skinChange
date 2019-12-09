//
//  AppImageManager.h
//  SandboxImage
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppImageManager : NSObject

+ (void)getSkinImage:(NSString *)imageName
            resultBlock:(void(^)(UIImage *image))resultBlock;

@end

NS_ASSUME_NONNULL_END
