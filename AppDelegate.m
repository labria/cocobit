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


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	clip_ = [[Clip alloc] init];
	[NSApp setServicesProvider:self];
	NSUpdateDynamicServices();
    
    NSAppleEventDescriptor *evtDesc = [[NSAppleEventManager sharedAppleEventManager] currentAppleEvent];
    AEEventID evtID = [evtDesc eventID];
    
    if (evtDesc && (evtID == kAEReopenApplication || evtID == kAEOpenApplication) && [evtDesc eventClass] == kCoreEventClass) {
        Clip * clip = [[Clip alloc] init];
        [clip getData];
        BitLyParser * parser = [BitLyParser newWithURLFromString:[clip string_]];
        [parser getData];
        NSString * result = [parser parseXML];
        [clip setData:result];
        [NSApp terminate:self];
    }
    /*
    NSAppleEventManager *appleEventManager = [NSAppleEventManager sharedAppleEventManager];
    [appleEventManager setEventHandler:self
                           andSelector:@selector 
     (handleOpenApplicationEvent:withReplyEvent:)
                         forEventClass:kCoreEventClass
                            andEventID:kAEOpenApplication];
    
    [appleEventManager setEventHandler:self
                           andSelector:@selector 
     (handleOpenApplicationEvent:withReplyEvent:)
                         forEventClass:kCoreEventClass
                            andEventID:kAEReopenApplication];
    
    [appleEventManager setEventHandler:self
                           andSelector:@selector 
     (handleOpenApplicationEvent:withReplyEvent:)
                         forEventClass:kCoreEventClass
                            andEventID:kAEOpenDocuments];
     */
    
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
    
    BitLyParser * parser = [BitLyParser newWithURLFromString:pboardString];
    [parser getData];
    NSString * result = [parser parseXML];
    [clip_ setData:result];
    [NSApp terminate:self];
}

@end
