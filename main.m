//
//  main.m
//  CocoBit
//
//  Created by Dmitry Krassovski on 20.04.09.
//  Copyright Getalime 2009. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Clip.h"
#import "BitLyParser.h"
int main(int argc, char *argv[])
{
    @try {
        Clip * clip = [[Clip alloc] init];
        [clip getData];
        BitLyParser * parser = [BitLyParser newWithURLFromString:[clip string_]];
        [parser getData];
        NSString * result = [parser parseXML];
        [clip setData:result];
    }
    @catch ( NSException *e ) {
        
    }
    
    @finally {
        return 0;
    }
    
    //return NSApplicationMain(argc,  (const char **) argv);
}
