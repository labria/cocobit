//
//  BitLyParser.m
//  BitLy
//
//  Created by Dmitry Krassovski on 19.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import "BitLyParser.h"

@implementation BitLyParser

@synthesize longURL_, queryURL_, xmlData_, shortURL_;

+ (id)newWithURLFromString:(NSString *) url
{
    return [[self alloc] initWithURLFromString:url];
}

- (id)initWithURLFromString:(NSString *) url
{
    if ((self = [super init])) {
        longURL_ = url;
        NSMutableString * temp_url_ = [NSMutableString new];
        [temp_url_ appendString:@"http://api.bit.ly/shorten?version=2.0.1&longUrl="];
        NSString * reserved = @";/?:@&=+$,";
        NSString * escapedURL = [NSMakeCollectable(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)longURL_, NULL, (CFStringRef)reserved, kCFStringEncodingUTF8)) autorelease];
        //NSString * escapedURL = [longURL_ stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [temp_url_ appendString:escapedURL];
        [temp_url_ appendString:@"&login=bitlyapidemo&apiKey=R_0da49e0a9118ff35f52f629d2d71bf07&format=xml"];
        queryURL_ = [NSURL URLWithString:temp_url_];
    }
    return self;
}
- (void)getData
{
    xmlData_ = [NSString stringWithContentsOfURL:queryURL_];
}

- (id)parseXML
{
    NSError * err=nil;
    NSXMLDocument *xmlDoc;
    xmlDoc = [[NSXMLDocument alloc] initWithXMLString:xmlData_ options:(NSXMLNodePreserveWhitespace|NSXMLNodePreserveCDATA) error:&err];
    NSArray * nodes = [xmlDoc nodesForXPath:@"./bitly/results/nodeKeyVal/shortUrl" error:&err];
    shortURL_ =[[nodes lastObject] stringValue];
    return shortURL_;
}
@end
