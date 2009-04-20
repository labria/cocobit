//
//  DropHandler.m
//  CocoBit
//
//  Created by Dmitry Krassovski on 21.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import "DropHandler.h"
#import "Clip.h"
#import "BitLyParser.h"
@implementation DropHandler

- (void)shortenURL:(NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error
{
    Clip * clip = [[Clip alloc] init];
    NSString * pboardString = [pboard stringForType:NSStringPboardType];
    
    BitLyParser * parser = [BitLyParser newWithURLFromString:pboardString];
    [parser getData];
    NSString * result = [parser parseXML];
    [clip setData:@"foo"];
}


@end
