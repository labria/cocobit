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
    /*
    Clip * clip = [[Clip alloc] init];
    [clip getData];
    NSURL * url = [NSURL URLWithString:[clip string_]];
    
    if (url){
        BitLyParser * parser = [BitLyParser newWithURLFromString:[clip string_]];
        [parser getData];
        NSString * result = [parser parseXML];
        [clip setData:result];
        return 0;
    } else {
        return NSApplicationMain(argc,  (const char **) argv);
    }
     */
    //return 0;
   return NSApplicationMain(argc,  (const char **) argv);
}
