//
//  SkinChangeRedModel.m
//  skinChange
//
//  Created by miao on 2019/11/30.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SkinChangeRedModel.h"

static NSString *const kZipRedFileName = @"RedBox";
static NSString *const kBundleRedFileName = @"redBundle";

@implementation SkinChangeRedModel

- (NSString *)getZipFileName
{
    return kZipRedFileName;
}
- (NSString *)getBundleFileName
{
    return kBundleRedFileName;
}


@end
