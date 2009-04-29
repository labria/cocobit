//
//  AppDelegate.m
//  Transcode
//
//  Created by flamefork on 22.08.08.
//  Copyright 2008 Flamefork. All rights reserved.
//

#import "AppDelegate.h"
#import "Clip.h"
#import "BitLyParser.h"
#import "GrowlSender.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	clip_ = [[Clip alloc] init];
	[NSApp setServicesProvider:self];
	NSUpdateDynamicServices();
    growl_ = [[GrowlSender alloc] init];
    [growl_ initializeGrowl];
    
    NSAppleEventDescriptor *evtDesc = [[NSAppleEventManager sharedAppleEventManager] currentAppleEvent];
    AEEventID evtID = [evtDesc eventID];
    
    if (evtDesc && (evtID == kAEReopenApplication || evtID == kAEOpenApplication) && [evtDesc eventClass] == kCoreEventClass) {
        Clip * clip = [[Clip alloc] init];
        [clip getData];
        NSString * url_string = [clip string_];
        NSString * url_scheme = [[NSURL URLWithString:url_string] scheme];
        if (url_scheme == nil) {
            // It is not a url
            [growl_ growlString:@"No valid URL provided"];
        } else {
            // It's  a url
            BitLyParser * parser = [BitLyParser newWithURLFromString:[clip string_]];
            [parser getData];
            NSString * result = [parser parseXML];
            if (result == nil) {
                [growl_ growlString:@"No url in reply"];
            } else {
                [growl_ growlString:result];
                [clip_ setData:result];
            }
        }
        
        [NSApp terminate:self];
    }
}


- (void)shortenURL:(NSPasteboard *)pboard 
			 userData:(NSString *)userData 
				error:(NSString **)error 
{ 
	NSString *pboardString;
	NSArray *types;
	types = [pboard types];
	if (![types containsObject:NSStringPboardType]) {
		*error = @"Error: couldn't transcode text.";
		return;
	}
	pboardString = [pboard stringForType:NSStringPboardType];
	if (!pboardString) {
		*error = @"Error: couldn't transcode text.";
		return;
	}
    
    NSString * url_scheme = [[NSURL URLWithString:pboardString] scheme];
    if (url_scheme == nil) {
        // It is not a url
        [growl_ growlString:@"No valid URL provided"];
    } else {
        // It's  a url
        BitLyParser * parser = [BitLyParser newWithURLFromString:pboardString];
        [parser getData];
        NSString * result = [parser parseXML];
        if (result == nil) {
            [growl_ growlString:@"No url in reply"];
        } else {
            [growl_ growlString:result];
            [clip_ setData:result];
        }
    }
    
    [NSApp terminate:self];
}

@end
