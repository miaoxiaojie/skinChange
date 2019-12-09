//
//  SkinChangeOrangeModel.m
//  skinChange
//
//  Created by miao on 2019/11/30.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SkinChangeOrangeModel.h"

static NSString *const kZipOrangeFileName = @"OrangeBox";
static NSString *const kBundleOrangeFileName = @"orangeBundle";

@implementation SkinChangeOrangeModel

- (NSString *)getZipFileName
{
    return kZipOrangeFileName;
}
- (NSString *)getBundleFileName
{
    return kBundleOrangeFileName;
}


@end
