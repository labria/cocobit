//
//  GrowlSender.m
//  CocoBit
//
//  Created by Dmitry Krassovski on 28.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import "GrowlSender.h"
#import "GrowlConstants.h"

@implementation GrowlSender

- (void) initializeGrowl
{
	growlReady = YES;
	
	// Tells the Growl framework that this class will receive callbacks
	[GrowlApplicationBridge setGrowlDelegate:self];
}


- (NSDictionary*) registrationDictionaryForGrowl
{
	// For this application, only one notification is registered
	NSArray* defaultNotifications = [NSArray arrayWithObjects:growlTestNotification, nil];
	NSArray* allNotifications = [NSArray arrayWithObjects:growlTestNotification, nil];
	
	NSDictionary* growlRegistration = [NSDictionary dictionaryWithObjectsAndKeys: 
                                       defaultNotifications, GROWL_NOTIFICATIONS_DEFAULT,
                                       allNotifications, GROWL_NOTIFICATIONS_ALL, nil];
	
	return growlRegistration;
}

- (void)growlString:(NSString *) string
{
    [GrowlApplicationBridge notifyWithTitle: @"Bit.ly client"
								description: string
						   notificationName:growlTestNotification 
                                   iconData:nil
								   priority:3
								   isSticky: NO
                               clickContext: nil ];  
    
    /*
     [GrowlApplicationBridge notifyWithTitle:[notifyWithTitle stringValue]
     description:[description stringValue]
     notificationName:growlTestNotification 
     iconData:[[iconData image] TIFFRepresentation]
     priority:[priority intValue]
     isSticky:[isSticky state] == NSOnState ? YES : NO 
     clickContext:[clickContextButton state] == NSOnState ? [NSDate date] : nil];
     */
}

@end
