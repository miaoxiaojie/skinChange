//
//  SkinChangeNormalModelInterface.h
//  skinChange
//
//  Created by miao on 2019/11/27.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SkinChangeNormalModelInterface <NSObject>


/**
 压缩包zip名称

 @return zip名称
 */
- (NSString *)getZipFileName;

/**
 bundle名称

 @return bundel名称
 */
- (NSString *)getBundleFileName;

@end

NS_ASSUME_NONNULL_END
