//
//  MTViewController.m
//  MTCompSwipeView
//
//  Created by rstx_reg@aliyun.com on 03/16/2018.
//  Copyright (c) 2018 rstx_reg@aliyun.com. All rights reserved.
//

#import "MTViewController.h"

@import MTComponent;

@interface MTViewController ()<MTComponentDataSource>
@property (nonatomic, strong) MTTComContainerVC *containerVC;

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addChildController:self.containerVC];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupLayoutConstraint {
    __weak typeof(self) weakSelf = self;
    [self.containerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.view);
    }];
}

- (NSArray<MTComponent *> *)componentLocalConfigData {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@(YES) forKey:@"enableComponent"];
    [dict setValue:@"top" forKey:@"dataKey"];
    [dict setValue:@"comp0" forKey:@"componentName"];
    [dict setValue:@"MTCompSwipeViewVC" forKey:@"componentVCName"];
    [dict setValue:@(0) forKey:@"style"];
    [dict setValue:@(0) forKey:@"section"];
    [dict setValue:@(0) forKey:@"row"];
    
    MTComponent *comp0 = [MTComponent initWithDict:dict];
    
    [dict setValue:@"Middle" forKey:@"dataKey"];
    [dict setValue:@"comp1" forKey:@"componentName"];
    [dict setValue:@(2) forKey:@"row"];
    [dict setValue:@"MTOtherCompVC" forKey:@"componentVCName"];
    MTComponent *comp1 = [MTComponent initWithDict:dict];
    
    [dict setValue:@"Bottom" forKey:@"dataKey"];
    [dict setValue:@"comp2" forKey:@"componentName"];
    [dict setValue:@(1) forKey:@"section"];
    [dict setValue:@(0) forKey:@"row"];
    [dict setValue:@"MTOtherCompVC" forKey:@"componentVCName"];
    MTComponent *comp2 = [MTComponent initWithDict:dict];
    
    return @[comp0,comp1,comp2];
}

- (NSArray<NSDictionary *> *)componentBussData {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *busData = [NSMutableDictionary dictionaryWithCapacity:0];
    [busData setObject:@"page1" forKey:@"pageID"];
    [busData setObject:@"title1" forKey:@"title"];
    [busData setObject:@"https://mobile.shenzhenair.com/image/lbt/20180312.jpg" forKey:@"picURL"];
    [busData setObject:@"https://www.apple.com" forKey:@"landingURL"];
    [busData setObject:@(2) forKey:@"index"];
    [busData setObject:@(NO) forKey:@"isNativeLanding"];
    [busData setObject:@"MTOtherCompVC" forKey:@"landingVCName"];
    [busData setObject:@(0) forKey:@"style"];
    [array addObject:busData];
    
    NSMutableDictionary *busData1 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData1 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180301.jpg" forKey:@"picURL"];
    [busData1 setObject:@(0) forKey:@"index"];
    [array addObject:busData1];
    
    NSMutableDictionary *busData2 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData2 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180302.jpg" forKey:@"picURL"];
    [busData2 setObject:@(YES) forKey:@"isNativeLanding"];
    [busData2 setObject:@(1) forKey:@"index"];
    [array addObject:busData2];
    
    
    return @[@{@"top":array,
               @"Middle":@[@"1",@"2",@"3"],
               @"Bottom":@[@"1",@"2",@"3"]}];
}

//MARK: - Getter And Setter
- (MTTComContainerVC *)containerVC {
    if (_containerVC) return _containerVC;
    _containerVC = [[MTTComContainerVC alloc] initWithStyle:UITableViewStyleGrouped];
    _containerVC.dataSource = self;
    
    return _containerVC;
}


@end
