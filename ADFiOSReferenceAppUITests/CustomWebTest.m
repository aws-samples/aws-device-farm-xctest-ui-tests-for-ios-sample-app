/*
 * Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 * http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "CustomWebTest.h"

static NSString * const HTTP_TAB_ID = @"HTTP";
static NSString * const NAVIGATION_BAR_ID = @"navigation bar";
static NSString * const GO_BUTTON_ID = @"Go";
static NSString * const URL = @"https://aws.amazon.com/documentation/devicefarm/";
static NSString * const DEVELOPER_GUIDE_LINK_ID = @"Developer Guide";
static NSString * const EXISTS_PREDICATE = @"exists==1";
static NSTimeInterval const TAP_DELAY = 1;
static NSTimeInterval const WEBSITE_LOAD_TIME = 30;

@implementation CustomWebTest

- (void)setUp {
    [super setUp];
    [[self app].tabBars.buttons[HTTP_TAB_ID] delayedTap:TAP_DELAY];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCustomWebView {
    [[self app].textFields[NAVIGATION_BAR_ID] tap];
    [[self app].textFields[NAVIGATION_BAR_ID] typeText:URL];
    [[self app].buttons[GO_BUTTON_ID] tap];
    
    XCUIElement * developerGuideLink = [self app].links[DEVELOPER_GUIDE_LINK_ID];
    NSPredicate * exists = [NSPredicate predicateWithFormat:EXISTS_PREDICATE];
    
    [self expectationForPredicate:exists evaluatedWithObject:developerGuideLink handler:nil];
    [self waitForExpectationsWithTimeout:WEBSITE_LOAD_TIME handler:nil];
    
    XCTAssertTrue([[self app].links[DEVELOPER_GUIDE_LINK_ID] exists]);
}

@end