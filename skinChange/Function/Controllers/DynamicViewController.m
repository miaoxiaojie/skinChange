//
//  DynamicViewController.m
//  skinChange
//
//  Created by miao on 2019/11/29.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "DynamicViewController.h"
#import "SkinChangeTonalInterface.h"
#import "SkinChangeOutgoing.h"
#import "AppColorManager.h"
#import "SkinChangeManagerInterface.h"
#import "UIColor+CoreAvailability.h"
#import "SkinChangeModel.h"

@interface DynamicViewController ()<SkinChangeTonalInterface>

@property (strong, nonatomic) UILabel *titileLable;

@end

@implementation DynamicViewController

- (void)dealloc {
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    [manager removeSkinChangeObserver:self];
}

- (void)skinChangeNotification
{
    _titileLable.textColor = [AppColorManager getTitleColorKey:@"dynamic_poem"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    [manager addSkinChangeObserver:self];
    
    NSString *str = [SkinChangeModel getDynamicPoem];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 8.0; // 设置行间距
    paragraphStyle.alignment = NSTextAlignmentJustified; //设置两端对齐显示
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedStr.length)];
    _titileLable = [[UILabel alloc]initWithFrame:CGRectMake(15, 88, [UIScreen mainScreen].bounds.size.width, 200)];
    _titileLable.font = [UIFont systemFontOfSize:18];
    _titileLable.textAlignment = NSTextAlignmentLeft;

    _titileLable.textColor = [UIColor hexColor:@"#333333"];
    _titileLable.attributedText = attributedStr;
    _titileLable.numberOfLines = 0;
    [self.view addSubview:_titileLable];
    
    UIImageView *start = [[UIImageView alloc]initWithFrame:CGRectMake(80, 300,30, 30)];
    start.center = self.view.center;
    start.image = [UIImage imageNamed:@"start"];
    [self.view addSubview:start];
}


@end

