//
//  SkinChangeNormalModel.m
//  skinChange
//
//  Created by miao on 2019/11/27.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SkinChangeNormalModel.h"

static NSString *const kZipNormalFileName = @"Sandbox";
static NSString *const kBundleNormalFileName = @"noramelBundle";

@implementation SkinChangeNormalModel

- (NSString *)getZipFileName
{
    return kZipNormalFileName;
}
- (NSString *)getBundleFileName
{
    return kBundleNormalFileName;
}

@end
