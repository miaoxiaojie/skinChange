//
//  AppColorManager.m
//  skinChange
//
//  Created by miao on 2019/11/27.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "AppColorManager.h"
#import "SkinChangeManagerInterface.h"
#import "SkinChangeOutgoing.h"
#import "UIColor+CoreAvailability.h"

@implementation AppColorManager

+ (NSString *)getTianMaoIconColorKey:(NSString *)key
{
    id<SkinChangeManagerInterface> skinColor = [SkinChangeOutgoing getSkinChangeManager];
    return [skinColor getColorStringForKey:key];
}

+ (UIColor *)getViewControllerbackgroundColor
{
    id<SkinChangeManagerInterface> skinColor = [SkinChangeOutgoing getSkinChangeManager];
    TonalSkinType currentType = [skinColor getCurrentSkinType];
    if (currentType == TonalSkinPurpleColor ) {
        return [UIColor purpleColor];
    }else if (currentType == TonalSkinOrangeColor) {
        return [UIColor orangeColor];
    }else if (currentType == TonalSkinRedColor) {
        return [UIColor redColor];
    }
    return [UIColor whiteColor];
}

+ (UIColor *)getTitleColorKey:(NSString *)key
{
    id<SkinChangeManagerInterface> skinColor = [SkinChangeOutgoing getSkinChangeManager];
    NSString *color = [skinColor getColorStringForKey:key];
    UIColor *resultColor = [UIColor hexColor:color];
    if (resultColor) {
        return resultColor;
    }
    resultColor = [UIColor hexColor:@"#333333"];
    return resultColor;
}

@end
