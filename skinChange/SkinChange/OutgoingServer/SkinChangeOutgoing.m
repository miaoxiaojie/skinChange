//
//  SkinChangeOutgoing.m
//  skinChange
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SkinChangeOutgoing.h"
#import "SkinChangeManager.h"
#import "SkinChangeNormalModel.h"
#import "SkinChangePurpleModel.h"
#import "SkinChangeOrangeModel.h"
#import "SkinChangeRedModel.h"
#import "SkinChangeManagerInterface.h"

@implementation SkinChangeOutgoing

+ (id<SkinChangeManagerInterface>)getSkinChangeManager
{
    return [SkinChangeManager sharedInstance];
}

+ (id<SkinChangeNormalModelInterface>)getSkinChangeModel:(TonalSkinType)type
{
    id<SkinChangeNormalModelInterface> model;
    switch (type) {
        case TonalSkinNormalColor:
            model= [[SkinChangeNormalModel alloc]init];
            break;
            case TonalSkinPurpleColor:
            model = [[SkinChangePurpleModel alloc]init];
            break;
            case TonalSkinOrangeColor:
            model = [[SkinChangeOrangeModel alloc]init];
            break;
            case TonalSkinRedColor:
            model = [[SkinChangeRedModel alloc]init];
            break;
        default:
            break;
    }
    
    return model;
}

@end
