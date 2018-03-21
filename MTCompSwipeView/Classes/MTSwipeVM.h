//
//  MTSwipeVM.h
//  MTCompSwipeView
//
//  Created by Jason Li on 2018/3/16.
//

#import "MTSwipePage.h"

@import MTBaseObjects;

@interface MTSwipeVM : MTBaseViewModel

@property (nonatomic, strong) NSDictionary *bussData; // 业务数据

- (void)toReloadDataSourceWithBussData:(NSDictionary *)bussData;

@end
