//
//  ViewController.m
//  skinChange
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ViewController.h"
#import "AppImageManager.h"
#import "UIColor+CoreAvailability.h"
#import "AppColorManager.h"
#import "SkinChangeManagerInterface.h"
#import "SkinChangeOutgoing.h"
#import "SkinChangeTonalInterface.h"
#import "SkinChangeModel.h"


@interface ViewController () <SkinChangeTonalInterface>


@property (strong, nonatomic) UIButton *sandboxBtn;
@property (strong, nonatomic) NSArray *imageNames;

@end

@implementation ViewController

- (void)dealloc {
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    [manager removeSkinChangeObserver:self];
}

- (void)skinChangeNotification
{
    for (NSInteger num = 0; num < 6; num ++) {
        UIButton *button = [self.view viewWithTag:1000 + num];
        [AppImageManager getSkinImage:_imageNames[num] resultBlock:^(UIImage * _Nonnull image) {
            [button setBackgroundImage:image forState:UIControlStateNormal];
        }];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageNames = [SkinChangeModel getIconPictureNameList];
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    [manager addSkinChangeObserver:self];
    NSArray *titlelist = [NSArray arrayWithObjects:@"紫色色调",@"橘色色调",@"大红色调", nil];
    CGFloat buttonWidth = ([UIScreen mainScreen].bounds.size.width - 30 - 2 * 15) / 3;
    for (NSInteger num = 0; num < 3; num++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(15 + buttonWidth * num + 15 * num,100, buttonWidth, 40);
        [button setTitle:titlelist[num] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.layer.borderWidth = 5;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        button.tag = 1 + num;
        [button addTarget:self action:@selector(p_changeSkin:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    CGFloat leftInterval = ([UIScreen mainScreen].bounds.size.width - 60 * 3) / 4;
    NSInteger num = 0;
    for (NSInteger row = 0; row < 2; row ++ ) {
        for (NSInteger column = 0; column < 3; column ++) {
             UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
             button.frame = CGRectMake(leftInterval + leftInterval * column + 60 * column, 200 + row * 60 + 30 * row, 60, 60);
             button.layer.cornerRadius = 40;
            [AppImageManager getSkinImage:_imageNames[num] resultBlock:^(UIImage * _Nonnull image) {
                [button setBackgroundImage:image forState:UIControlStateNormal];
            }];
            button.tag = 1000 + num;
            num++;
            [self.view addSubview:button];
        }
    }
    
    [self p_shakeaAimation];
    
}

- (void)p_changeSkin:(UIButton *)sender
{
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    switch (sender.tag) {
        case 1:
            [manager setCurrentSkinType:TonalSkinPurpleColor];
            break;
        case 2:
            [manager setCurrentSkinType:TonalSkinOrangeColor];
            break;
        case 3:
            [manager setCurrentSkinType:TonalSkinRedColor];
            break;
            
        default:
            break;
    }
    [manager postSkinChangeNotification];
    
}

- (void)p_showSandboxImage:(UIButton *)sender
{
    __weak __typeof(&*self)weakSelf = self;
    [AppImageManager getSkinImage:@"save_phonenumber_off_img@2x" resultBlock:^(UIImage * _Nonnull image) {
        [weakSelf.sandboxBtn setBackgroundImage:image forState:UIControlStateNormal];
    }];
    NSString *aColor = [AppColorManager getTianMaoIconColorKey:@"icon_tmall"];
    [_sandboxBtn setTitleColor:[UIColor hexColor:aColor] forState:UIControlStateNormal];
}

- (void)p_shakeaAimation
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400,200, 200)];
    imageView.center = self.view.center;
    imageView.animationImages = [self p_initialImageArray];
    imageView.animationDuration = 1.5f;
    imageView.animationRepeatCount = MAXFLOAT;
    [imageView startAnimating];
    [self.view addSubview:imageView];
}

- (NSArray *)p_initialImageArray {
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (NSInteger num = 1; num < 9; num++) {
        NSString *imageName = [NSString stringWithFormat:@"ThanksForBoss00%ld", num];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"tiff"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [imageArray addObject:image];
    }
    return imageArray;
}

@end
