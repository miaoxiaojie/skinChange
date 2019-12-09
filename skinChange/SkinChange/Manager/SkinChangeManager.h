//
//  SkinChangeManager.h
//  skinChange
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkinChangeManagerInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface SkinChangeManager : NSObject <SkinChangeManagerInterface>

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
