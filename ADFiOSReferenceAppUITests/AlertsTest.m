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

#import "AlertsTest.h"

static NSString * const OK_BUTTON_ID = @"OK";
static NSString * const MORE_TAB_ID = @"More";
static NSString * const ALERTS_TAB_ID = @"Alerts";
static NSString * const ALERT_BUTTON_ID = @"Alert";
static NSString * const MODAL_BUTTON_ID = @"Modal";
static NSString * const ALERT_MESSAGE = @"This is an alert";
static NSString * const MODAL_MESSAGE = @"This is a modal view";
static NSTimeInterval const TAP_DELAY = 1;

@implementation AlertsTest

- (void)setUp {
    [super setUp];
    
    if ([[self app].buttons[ALERTS_TAB_ID] exists]) {
        [[self app].buttons[ALERTS_TAB_ID] delayedTap:TAP_DELAY];
    } else {
        [[self app].tabBars.buttons[MORE_TAB_ID] delayedTap:TAP_DELAY];
        [[self app].staticTexts[ALERTS_TAB_ID] tap];
    }
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAlert {
    [[self app].buttons[ALERT_BUTTON_ID] tap];
    XCTAssertTrue([[self app].staticTexts[ALERT_MESSAGE] exists]);
    
    [[self app].buttons[OK_BUTTON_ID] tap];
    XCTAssertFalse([[self app].staticTexts[ALERT_MESSAGE] exists]);
}

- (void)testModal {
    [[self app].buttons[MODAL_BUTTON_ID] tap];
    XCTAssertTrue([[self app].staticTexts[MODAL_MESSAGE] exists]);
    
    [[self app].buttons[OK_BUTTON_ID] tap];
    XCTAssertFalse([[self app].staticTexts[MODAL_MESSAGE] exists]);
}

@end
