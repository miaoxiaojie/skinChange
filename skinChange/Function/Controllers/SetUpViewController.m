//
//  SetUpViewController.m
//  skinChange
//
//  Created by miao on 2019/11/29.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "SetUpViewController.h"
#import "SkinChangeTonalInterface.h"
#import "SkinChangeOutgoing.h"
#import "AppColorManager.h"
#import "SkinChangeManagerInterface.h"
#import "AppImageManager.h"
#import "SkinChangeModel.h"

@interface SetUpViewController ()<SkinChangeTonalInterface,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *list;

@end

@implementation SetUpViewController

- (void)dealloc {
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    [manager removeSkinChangeObserver:self];
}

- (void)skinChangeNotification
{
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    id<SkinChangeManagerInterface> manager = [SkinChangeOutgoing getSkinChangeManager];
    [manager addSkinChangeObserver:self];
    self.list = [SkinChangeModel getSetUpData];
    [self p_initTableView];
}

- (void)p_initTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                          style:UITableViewStyleGrouped];
    tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height- 80);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.backgroundColor = [UIColor colorWithRed:236/255.0
                                                    green:236/255.0
                                                     blue:236/255.0
                                                    alpha:1];
    
    [self.view addSubview:tableView];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.tableView = tableView;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identiferId = NSStringFromClass([self class]);
    UITableViewCell *tabelCell = [tableView dequeueReusableCellWithIdentifier:identiferId];
    if(nil == tabelCell)
    {
        tabelCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiferId];
    }
    NSDictionary *dict = self.list[indexPath.section];
    tabelCell.textLabel.text = [dict objectForKey:@"title"];
    NSString *name = [dict objectForKey:@"pictureName"];
    tabelCell.textLabel.textColor = [AppColorManager getTitleColorKey:@"setUp_titleColor"];
    [AppImageManager getSkinImage:name resultBlock:^(UIImage * _Nonnull image) {
        tabelCell.imageView.image = image;
    }];
    return tabelCell;
}


@end
