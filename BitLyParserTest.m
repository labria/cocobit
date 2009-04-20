//
//  BitLyParserTest.m
//  BitLy
//
//  Created by Dmitry Krassovski on 19.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BitLyParser.h"
@interface BitLyParserTest : SenTestCase {
    BitLyParser * parser_;
}

@end



@implementation BitLyParserTest

- (void)setUp
{
     parser_ = [BitLyParser newWithURLFromString:@"http://ya.ru"];
}

- (void)tearDown
{
    [parser_ release];
}

- (void)testTest
{
    STAssertFalse(NO, @"Should be true");
}

- (void)testCreation
{
    STAssertEqualObjects([parser_ longURL_], @"http://ya.ru", @"should be ya.ru");
    STAssertEqualObjects([parser_ queryURL_],
                         [NSURL URLWithString:@"http://api.bit.ly/shorten?version=2.0.1&longUrl=http://ya.ru&login=bitlyapidemo&apiKey=R_0da49e0a9118ff35f52f629d2d71bf07&format=xml"], 
                         @"shoulf build it");

}

- (void)testCreationWithEscaping
{
    parser_ = [BitLyParser newWithURLFromString:@"http://www.google.com/notebook/?nbid=CalhjUfC37Hs%2FBDRJPQgoQhq3Z_YAk#b=CalhjUfC37Hs%2FBDQok3goQvfTWxook"];
    STAssertEqualObjects([parser_ longURL_], @"http://www.google.com/notebook/?nbid=CalhjUfC37Hs%2FBDRJPQgoQhq3Z_YAk#b=CalhjUfC37Hs%2FBDQok3goQvfTWxook", @"should be ya.ru");
    STAssertEqualObjects([parser_ queryURL_],
                         [NSURL URLWithString:@"http://api.bit.ly/shorten?version=2.0.1&longUrl=http://www.google.com/notebook/?nbid=CalhjUfC37Hs%252FBDRJPQgoQhq3Z_YAk%23b=CalhjUfC37Hs%252FBDQok3goQvfTWxook&login=bitlyapidemo&apiKey=R_0da49e0a9118ff35f52f629d2d71bf07&format=xml"], 
                         @"shoulf build it");
    
}

- (void)testGettindData
{
    [parser_ getData];
    STAssertEqualObjects([parser_ xmlData_],
                         @"<bitly><errorCode>0</errorCode><errorMessage></errorMessage><results><nodeKeyVal><userHash>vKu0d</userHash><shortKeywordUrl></shortKeywordUrl><hash>WQuM</hash><nodeKey><![CDATA[http://ya.ru]]></nodeKey><shortUrl>http://bit.ly/vKu0d</shortUrl></nodeKeyVal></results><statusCode>OK</statusCode></bitly>",
                         @"should be right");
}

- (void)testGettingShortUrl
{
    [parser_ getData];
    //[parser_ parseXML];
    STAssertEqualObjects([parser_ parseXML], @"http://bit.ly/vKu0d", @"should be right");
}
@end
