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

#import "LoginTest.h"

static NSString * const MORE_TAB_ID = @"More";
static NSString * const LOGIN_BUTTON_ID = @"Login";
static NSString * const USERNAME_FIELD_ID = @"Username";
static NSString * const PASSWORD_FIELD_ID = @"Password";
static NSString * const VALID_USERNAME = @"admin";
static NSString * const VALID_PASSWORD = @"password";
static NSString * const INVALID_USERNAME = @"username";
static NSString * const INVALID_PASSWORD = @"passowrd";
static NSString * const VALID_LOGIN_MESSAGE = @"Logged in as admin";
static NSString * const INVALID_LOGIN_MESSAGE = @"PERMISSION DENIED";
static NSTimeInterval const TAP_DELAY = 1;

@implementation LoginTest

- (void)setUp {
    [super setUp];
    [[self app].tabBars.buttons[MORE_TAB_ID] delayedTap:TAP_DELAY];
    [[self app].staticTexts[LOGIN_BUTTON_ID] tap];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testValidLogin {
    [[self app].textFields[USERNAME_FIELD_ID] tap];
    [[self app].textFields[USERNAME_FIELD_ID] typeText:VALID_USERNAME];
    [[self app].secureTextFields[PASSWORD_FIELD_ID] tap];
    [[self app].secureTextFields[PASSWORD_FIELD_ID] typeText:VALID_PASSWORD];
    [[self app].buttons[LOGIN_BUTTON_ID] tap];
    
    XCTAssertTrue([[self app].staticTexts[VALID_LOGIN_MESSAGE] exists]);
}

- (void)testInvalidLogin {
    [[self app].textFields[USERNAME_FIELD_ID] tap];
    [[self app].textFields[USERNAME_FIELD_ID] typeText:INVALID_USERNAME];
    [[self app].secureTextFields[PASSWORD_FIELD_ID] tap];
    [[self app].secureTextFields[PASSWORD_FIELD_ID] typeText:INVALID_PASSWORD];
    [[self app].buttons[LOGIN_BUTTON_ID] tap];
    
    XCTAssertTrue([[self app].staticTexts[INVALID_LOGIN_MESSAGE] exists]);
}

@end

