//
//  SkinChangeModel.m
//  skinChange
//
//  Created by miao on 2019/12/4.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SkinChangeModel.h"

@implementation SkinChangeModel

+ (NSArray <NSDictionary *>*)getSetUpData
{
    return [NSArray arrayWithObjects:
            @{@"title":@"我的相册",@"pictureName":@"photo"},
            @{@"title":@"我的故事",@"pictureName":@"story"},
            @{@"title":@"我的赞",@"pictureName":@"praise"},
            @{@"title":@"粉丝服务",@"pictureName":@"service"}, nil];
}

+ (NSString *)getDynamicPoem
{
 return  @"不要因为也行会改变\n就不肯说那句美丽的誓言\n不因为也会会分离\n就不敢求一次倾心的相遇\n总有些什么\n会留下来的吧";
}

+ (NSArray *)getIconPictureNameList
{
    return [NSArray arrayWithObjects:
            @"LittlePeople",
            @"ChargingTreasure",
            @"calendar",
            @"glass",
            @"notebook",
            @"music", nil];
}

@end
