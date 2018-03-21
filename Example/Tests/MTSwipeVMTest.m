//
//  MTSwipeVMTest.m
//  MTCompSwipeView_Tests
//
//  Created by Jason Li on 2018/3/19.
//  Copyright © 2018年 rstx_reg@aliyun.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@import MTCompSwipeView;

@interface MTSwipeVMTest : XCTestCase

@end

@implementation MTSwipeVMTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testToReloadDataSourceWithBussData {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *busData = [NSMutableDictionary dictionaryWithCapacity:0];
    [busData setObject:@"page1" forKey:@"pageID"];
    [busData setObject:@"title1" forKey:@"title"];
    [busData setObject:@"https://mobile.shenzhenair.com/image/lbt/20180312.jpg" forKey:@"picURL"];
    [busData setObject:@"www.baidu.com" forKey:@"landingURL"];
    [busData setObject:@(2) forKey:@"index"];
    [busData setObject:@(NO) forKey:@"isNativeLanding"];
    [busData setObject:@"page1" forKey:@"landingVCName"];
    [busData setObject:@(0) forKey:@"style"];
    [array addObject:busData];
    
    NSMutableDictionary *busData1 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData1 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180301.jpg" forKey:@"picURL"];
    [busData1 setObject:@(0) forKey:@"index"];
    [array addObject:busData1];
    
    NSMutableDictionary *busData2 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData2 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180302.jpg" forKey:@"picURL"];
    [busData2 setObject:@(1) forKey:@"index"];
    [array addObject:busData2];
    
    MTSwipeVM *vm = [[MTSwipeVM alloc] init];
    [vm toReloadDataSourceWithBussData:@{@"array":array}];
    
    XCTAssertEqual(vm.dataSource.count, 3);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[0]).index == 0);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[1]).index == 1);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[2]).index == 2);
    
}

- (void)testToReloadDataSourceWithBussDataWithArray {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *busData = [NSMutableDictionary dictionaryWithCapacity:0];
    [busData setObject:@"page1" forKey:@"pageID"];
    [busData setObject:@"title1" forKey:@"title"];
    [busData setObject:@"https://mobile.shenzhenair.com/image/lbt/20180312.jpg" forKey:@"picURL"];
    [busData setObject:@"www.baidu.com" forKey:@"landingURL"];
    [busData setObject:@(2) forKey:@"index"];
    [busData setObject:@(NO) forKey:@"isNativeLanding"];
    [busData setObject:@"page1" forKey:@"landingVCName"];
    [busData setObject:@(0) forKey:@"style"];
    
    NSMutableDictionary *busData1 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData1 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180301.jpg" forKey:@"picURL"];
    [busData1 setObject:@(0) forKey:@"index"];
    
    NSMutableDictionary *busData2 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData2 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180302.jpg" forKey:@"picURL"];
    [busData2 setObject:@(1) forKey:@"index"];
    
    MTSwipeVM *vm = [[MTSwipeVM alloc] init];
    [vm toReloadDataSourceWithBussData:@{@"array":@[busData,busData1,busData2]}];
    
    XCTAssertEqual(vm.dataSource.count, 3);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[0]).index == 0);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[1]).index == 1);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[2]).index == 2);
    
}

- (void)testToReloadDataSourceWithBussDataWithDict {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSMutableDictionary *busData = [NSMutableDictionary dictionaryWithCapacity:0];
    [busData setObject:@"page1" forKey:@"pageID"];
    [busData setObject:@"title1" forKey:@"title"];
    [busData setObject:@"https://mobile.shenzhenair.com/image/lbt/20180312.jpg" forKey:@"picURL"];
    [busData setObject:@"www.baidu.com" forKey:@"landingURL"];
    [busData setObject:@(2) forKey:@"index"];
    [busData setObject:@(NO) forKey:@"isNativeLanding"];
    [busData setObject:@"page1" forKey:@"landingVCName"];
    [busData setObject:@(0) forKey:@"style"];
    
    NSMutableDictionary *busData1 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData1 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180301.jpg" forKey:@"picURL"];
    [busData1 setObject:@(0) forKey:@"index"];
    
    NSMutableDictionary *busData2 = [NSMutableDictionary dictionaryWithDictionary:busData];
    [busData2 setObject:@"https://mobile.shenzhenair.com/image/lbt/20180302.jpg" forKey:@"picURL"];
    [busData2 setObject:@(1) forKey:@"index"];
    
    MTSwipeVM *vm = [[MTSwipeVM alloc] init];
    [vm toReloadDataSourceWithBussData:@{@"array":@{@"page1":busData,@"page2":busData1,@"page3":busData2}}];
    
    XCTAssertEqual(vm.dataSource.count, 3);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[0]).index == 0);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[1]).index == 1);
    XCTAssertTrue(((MTSwipePage *)vm.dataSource[2]).index == 2);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
