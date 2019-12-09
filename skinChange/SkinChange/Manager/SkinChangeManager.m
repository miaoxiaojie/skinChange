//
//  SkinChangeManager.m
//  skinChange
//
//  Created by miao on 2019/11/26.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SkinChangeManager.h"
#import "FileUtil.h"
#import "SkinChangeNormalModelInterface.h"
#import "SkinChangeOutgoing.h"
#import "SkinChangeTonalInterface.h"

@interface SkinChangeManager()

@property (nonatomic,strong) NSDictionary *colorDict;
@property (nonatomic,assign) NSInteger currentTonalSkinType;
@property (nonatomic,strong) NSMutableArray *skinChangeTonalSkin;

@end

@implementation SkinChangeManager

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static SkinChangeManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SkinChangeManager alloc] init];
    });
    return sharedInstance;
}

- (NSString *)getSkinBasePath
{
    NSString *filePath = [[FileUtil fileCacheDir] stringByAppendingPathComponent:@"Skins"];
    return filePath;
}

- (NSString *)getAppSkinBasePath:(TonalSkinType)type
{
    NSString *filePath = [[FileUtil fileCacheDir] stringByAppendingPathComponent:@"Skins"];
    id<SkinChangeNormalModelInterface> model = [SkinChangeOutgoing getSkinChangeModel:type];
    return [filePath stringByAppendingPathComponent:[model getZipFileName]];
}

- (NSString *)getSkinImagePath
{
    NSString *filePath = [self getAppSkinBasePath:_currentTonalSkinType];
    id<SkinChangeNormalModelInterface> model = [SkinChangeOutgoing getSkinChangeModel:_currentTonalSkinType];
    filePath = [filePath stringByAppendingPathComponent:[model getZipFileName]];
    filePath = [filePath stringByAppendingPathComponent:@"Images"];
    return filePath;
}

- (NSBundle *)getCurrentBundle
{
    id<SkinChangeNormalModelInterface> model = [SkinChangeOutgoing getSkinChangeModel:_currentTonalSkinType];
    NSString *bundleName = [[model getBundleFileName] stringByAppendingString:@".bundle"];
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:bundleName];
    return [NSBundle bundleWithPath:bundlePath];
}

- (NSString *)getColorStringForKey:(NSString *)key
{
    NSString *infoFilePath = [self getColorInfoFilePath];
    infoFilePath = [infoFilePath stringByAppendingPathComponent:@"/colorInfo.plist"];
    _colorDict = [[NSDictionary alloc] initWithContentsOfFile:infoFilePath];
    NSString *color = [_colorDict objectForKey:key];
    return color;
}

 - (NSString *)getColorInfoFilePath
{
    NSString *filePath = [self getAppSkinBasePath:_currentTonalSkinType];
    id<SkinChangeNormalModelInterface> model = [SkinChangeOutgoing getSkinChangeModel:_currentTonalSkinType];
    filePath = [filePath stringByAppendingPathComponent:[model getZipFileName]];
    filePath = [filePath stringByAppendingPathComponent:@"Color"];
    return filePath;
}

- (void)setCurrentSkinType:(TonalSkinType)type
{
    _currentTonalSkinType = type;
}

- (TonalSkinType)getCurrentSkinType
{
    return _currentTonalSkinType;
}


- (void)addSkinChangeObserver:(id<SkinChangeTonalInterface>)observer
{
    [self.skinChangeTonalSkin addObject:observer];
}

- (void)removeSkinChangeObserver:(id<SkinChangeTonalInterface>)observer
{
    [self.skinChangeTonalSkin removeObject:observer];
}

- (void)postSkinChangeNotification
{
    NSArray *array = [NSArray arrayWithArray:self.skinChangeTonalSkin];
    [array enumerateObjectsUsingBlock:^(id<SkinChangeTonalInterface>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj && [obj respondsToSelector:@selector(skinChangeNotification)])
        {
            [obj skinChangeNotification];
        }
    }];
}


-(NSMutableArray *)skinChangeTonalSkin
{
    if (!_skinChangeTonalSkin) {
        _skinChangeTonalSkin = (__bridge_transfer NSMutableArray *)CFArrayCreateMutable(nil, 0, nil);
    }
    return _skinChangeTonalSkin;
}

@end
