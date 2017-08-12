//
//  WeightTrainingUITests.m
//  WeightTrainingUITests
//

/*
 
 Copyright 2017 Rodney Degracia
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
 modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
 is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <XCTest/XCTest.h>

@interface WeightTrainingUITests : XCTestCase

@end

@implementation WeightTrainingUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_150161646_no_stations_warning {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Records"].buttons[@"Add"] tap];
    [app.alerts[@"Unable to create Record"].buttons[@"OK"] tap];
    sleep(5);
    XCTAssert(app.navigationBars[@"Create Station"].hittable, @"Create Station should exist");
    [app.navigationBars[@"Create Station"].buttons[@"Cancel"] tap];
    
}

- (void)test_150161667_station_record_defaults {
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.tabBars.buttons[@"Stations"] tap];
    [app.navigationBars[@"Stations"].buttons[@"Add"] tap];
    
    
}

@end
