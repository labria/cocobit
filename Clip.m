//
//  Clip.m
//  BitLy
//
//  Created by Dmitry Krassovski on 20.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import "Clip.h"

@implementation Clip

@synthesize string_;

- (void)getData
{
    NSPasteboard * board = [NSPasteboard generalPasteboard];
    
    string_ = [board stringForType: NSStringPboardType];
}
- (void)setData:(NSString *) string
{
    NSPasteboard * board = [NSPasteboard generalPasteboard];
    [board declareTypes: [NSArray arrayWithObject: NSStringPboardType]
               owner: nil];
    [board setString: string forType: NSStringPboardType];
}

@end
