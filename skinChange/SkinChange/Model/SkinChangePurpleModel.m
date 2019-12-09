//
//  SkinChangePurpleModel.m
//  skinChange
//
//  Created by miao on 2019/11/30.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SkinChangePurpleModel.h"

static NSString *const kZipPurpleFileName = @"PurpleBox";
static NSString *const kBundlePurpleFileName = @"purpleBundle";

@implementation SkinChangePurpleModel

- (NSString *)getZipFileName
{
    return kZipPurpleFileName;
}
- (NSString *)getBundleFileName
{
    return kBundlePurpleFileName;
}

@end
