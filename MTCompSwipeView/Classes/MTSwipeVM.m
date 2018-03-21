//
//  MTSwipeVM.m
//  MTCompSwipeView
//
//  Created by Jason Li on 2018/3/16.
//

#import "MTSwipeVM.h"

@implementation MTSwipeVM

- (void)toReloadDataSourceWithBussData:(NSDictionary *)bussData {
    self.bussData = bussData;
    self.dataSource = nil;
    [self toReloadDataSourceBeforeRequest:nil onFinished:nil onFailed:nil];
}

- (void)toReloadDataSourceBeforeRequest:(VoidBlock)before onFinished:(DataSourceStatusBlock)finished onFailed:(VoidBlock)failed {
    if (before) before();
    
    if (self.bussData.count == 0) {
        if (failed) failed();
        return;
    }
    
    for (NSString *key in [self.bussData allKeys]) {
        [self toDealSwipePageDataSourceWithValue:self.bussData[key]];
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    [self.dataSource sortUsingDescriptors:@[sort]];
    
    if (finished) finished(DataSourceStatusNormal);
    
}

- (void)toDealSwipePageDataSourceWithValue:(id)value {
    if ([value isKindOfClass:[NSArray class]]) {
        for (id subValue in value) {
            [self toDealSwipePageDataSourceWithValue:subValue];
        }
    } else if ([value isKindOfClass:[NSDictionary class]]) {
        // 判断字典的深度，如果字典的Key值中包含pageID任务是业务数据，否则继续嵌套
        if ([[(NSDictionary *)value allKeys] containsObject:@"pageID"]) {
            MTSwipePage *page = [MTSwipePage initWithDict:value];
            [self.dataSource addObject:page];
        } else {
            // 继续下探
            for (id subKey in [(NSDictionary *)value allKeys]) {
                [self toDealSwipePageDataSourceWithValue:(NSDictionary *)value[subKey]];
            }
        }
    }
}

@end
