//
//  ZipUtil.m
//  SandboxImage
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZipUtil.h"
#import "ZipArchive.h"

@implementation ZipUtil

+ (BOOL)unArchiveZipWithName:(NSString *)zipFileName dirPath:(NSString *)dirPath
{
    BOOL ret = NO;
    NSString *shinDir = dirPath;
    
    NSString* l_zipfile = [shinDir stringByAppendingPathComponent:zipFileName];
    
    // 基于新版本zipArchive实现,解压在当前路径下
    ret = [ZipArchive unzipFileAtPath:l_zipfile toDestination:shinDir];
    return ret;
}

@end
