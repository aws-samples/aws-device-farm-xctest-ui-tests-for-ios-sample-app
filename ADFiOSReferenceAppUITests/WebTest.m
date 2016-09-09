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

#import "WebTest.h"

static NSString * const MORE_TAB_ID = @"More";
static NSString * const WEB_ID = @"Web";
static NSString * const DEVELOPER_GUIDE_LINK_ID = @"Developer Guide";
static NSString * const EXISTS_PREDICATE = @"exists==1";
static NSTimeInterval const TAP_DELAY = 1;
static NSTimeInterval const WEBSITE_LOAD_TIME = 30;

@implementation WebTest

- (void)setUp {
    [super setUp];
    [[self app].buttons[MORE_TAB_ID] delayedTap:TAP_DELAY];
    [[self app].staticTexts[WEB_ID] tap];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWebView {   
    XCUIElement * developerGuideLink = [self app].links[DEVELOPER_GUIDE_LINK_ID];
    NSPredicate * exists = [NSPredicate predicateWithFormat:EXISTS_PREDICATE];

    [self expectationForPredicate:exists evaluatedWithObject:developerGuideLink handler:nil];
    [self waitForExpectationsWithTimeout:WEBSITE_LOAD_TIME handler:nil];

    XCTAssertTrue([[self app].links[DEVELOPER_GUIDE_LINK_ID] exists]);
}

@end
