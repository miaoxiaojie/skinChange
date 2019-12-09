//
//  SkinChangeOutgoing.h
//  skinChange
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkinChangeManagerInterface.h"
@protocol SkinChangeNormalModelInterface;

NS_ASSUME_NONNULL_BEGIN

@interface SkinChangeOutgoing : NSObject

+ (id<SkinChangeManagerInterface>)getSkinChangeManager;
+ (id<SkinChangeNormalModelInterface>)getSkinChangeModel:(TonalSkinType)type;

@end

NS_ASSUME_NONNULL_END
