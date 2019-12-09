//
//  RunTimeUtil.h
//  skinChange
//
//  Created by miao on 2019/12/5.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RunTimeUtil : NSObject

extern const struct RunTimeUtil
{
    void (*transforInstanceMethod_cmbc)(Class, SEL, SEL);
    
}runTimeUtil;

@end

NS_ASSUME_NONNULL_END
