//
//  CRTODataEventTests.m
//  advertiser-sdk
//
//  Copyright (c) 2015 Criteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "CRTODataEvent.h"

@interface CRTODataEventTests : XCTestCase

@end

@implementation CRTODataEventTests
{
    CRTODataEvent* dataEvent;

    NSMutableString* dateKey;
    NSMutableString* integerKey;
    NSMutableString* floatKey;
    NSMutableString* stringKey;
}

- (void)setUp
{
    [super setUp];

    dataEvent = [[CRTODataEvent alloc] init];

    dateKey    = [NSMutableString stringWithString:@"A_Date_Key"];
    integerKey = [NSMutableString stringWithString:@"An_Integer_Key"];
    floatKey   = [NSMutableString stringWithString:@"A_Float_Key"];
    stringKey  = [NSMutableString stringWithString:@"A_String_Key"];
}

- (void)tearDown
{

    [super tearDown];
}

- (void) testInit
{
    XCTAssertNotNil(dataEvent);
}

- (void) testDateExtraData
{
    NSDate* someDate = [NSDate dateWithTimeIntervalSince1970:1000000000];

    [dataEvent setDateExtraData:someDate ForKey:dateKey];

    NSDate* resultDate = [dataEvent dateExtraDataForKey:@"A_Date_Key"];

    XCTAssertEqualObjects(someDate, resultDate);
}

- (void) testDateExtraDataNoValue
{
    NSDate* resultDate = [dataEvent dateExtraDataForKey:@"BadKey"];

    XCTAssertNil(resultDate);
}

- (void) testIntegerExtraData
{
    NSInteger someInteger = 0xdeadbeef;

    [dataEvent setIntegerExtraData:someInteger ForKey:integerKey];

    NSInteger resultInteger = [dataEvent integerExtraDataForKey:@"An_Integer_Key"];

    XCTAssertEqual(someInteger, resultInteger);
}

- (void) testIntegerExtraDataNoValue
{
    NSInteger resultInteger = [dataEvent integerExtraDataForKey:@"BadKey"];

    XCTAssertEqual(resultInteger, 0);
}

- (void) testFloatExtraData
{
    float someFloat = 999.85;

    [dataEvent setFloatExtraData:someFloat ForKey:floatKey];

    float resultFloat = [dataEvent floatExtraDataForKey:@"A_Float_Key"];

    XCTAssertEqual(someFloat, resultFloat);
}

- (void) testFloatExtraDataNoValue
{
    float resultFloat = [dataEvent floatExtraDataForKey:@"BadKey"];

    XCTAssertEqual(resultFloat, 0.0f);
}

- (void) testStringExtraData
{
    NSString* someString = @"Four score and seven years ago...";

    [dataEvent setStringExtraData:someString ForKey:stringKey];

    NSString* resultString = [dataEvent stringExtraDataForKey:@"A_String_Key"];

    XCTAssertEqualObjects(someString, resultString);
}

- (void) testStringExtraDataNoValue
{
    NSString* resultString = [dataEvent stringExtraDataForKey:@"BadKey"];

    XCTAssertNil(resultString);
}


@end
