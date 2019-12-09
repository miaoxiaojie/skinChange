//
//  ZipUtil.h
//  SandboxImage
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZipUtil : NSObject

/**
 解压zip文件，解压后不删除zip文件

 @param zipFileName 文件名称
 @param dirPath 文件所在目录
 @return 解压是否成功
 */
+ (BOOL)unArchiveZipWithName:(NSString *)zipFileName dirPath:(NSString *)dirPath;

@end

NS_ASSUME_NONNULL_END
