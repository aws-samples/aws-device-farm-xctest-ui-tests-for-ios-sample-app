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

#import "DatePickerTest.h"

static int const DATE_PICKER_INDEX = 2;
static NSUInteger const MONTH_WHEEL_INDEX = 0;
static NSUInteger const DAY_WHEEL_INDEX = 1;
static NSUInteger const YEAR_WHEEL_INDEX = 2;
static NSString * const INITIAL_HEADER = @"Please select a date from the date picker";
static NSString * const MONTH = @"July";
static NSString * const DAY = @"5";
static NSString * const YEAR = @"1994";
static NSString * const EXPECTED_DATE = @"Jul 5, 1994";

@implementation DatePickerTest

- (void)setUp {
    [super setUp];
    
    for (int i = 0; i < DATE_PICKER_INDEX; i++) {
        [[self app] swipeLeft];
    }
}

- (void)tearDown {
    [super tearDown];
}

- (void)testDatePicker {
    XCTAssertTrue([[self app].staticTexts[INITIAL_HEADER] exists]);
    XCUIElementQuery * pickerWheels = [[self app] pickerWheels];
    
    [[pickerWheels elementBoundByIndex:MONTH_WHEEL_INDEX] adjustToPickerWheelValue:MONTH];
    [[pickerWheels elementBoundByIndex:DAY_WHEEL_INDEX] adjustToPickerWheelValue:DAY];
    [[pickerWheels elementBoundByIndex:YEAR_WHEEL_INDEX] adjustToPickerWheelValue:YEAR];
    
    XCTAssertTrue([[self app].staticTexts[EXPECTED_DATE] exists]);
}

@end