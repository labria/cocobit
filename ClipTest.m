//
//  ClipTest.m
//  BitLy
//
//  Created by Dmitry Krassovski on 20.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "Clip.h"
@interface ClipTest : SenTestCase {
    
}
@end


@implementation ClipTest

- (void)testGettingAndSettingData
{
    Clip * clip = [[Clip alloc] init];
    [clip setData:@"http://ya.ru"];
    [clip getData];
    STAssertEqualObjects([clip string_], @"http://ya.ru", @"blah");
}
@end
