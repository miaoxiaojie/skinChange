//
//  RunTimeUtil.m
//  skinChange
//
//  Created by miao on 2019/12/5.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "RunTimeUtil.h"
#import <objc/runtime.h>

@implementation RunTimeUtil

/**
 * 运行时互换函数调用顺序, 实例方法
 */
static void transforInstanceMethod_cmbc(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    if (originalMethod != NULL && swizzledMethod != NULL)
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

const struct RunTimeUtil runTimeUtil = {
    
    .transforInstanceMethod_cmbc = transforInstanceMethod_cmbc,
};

@end
