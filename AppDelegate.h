//
//  AppDelegate.h
//  CocoBit
//
//  Created by Dmitry Krassovski on 28.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import "Clip.h"
#import "./Growl.framework/Headers/GrowlApplicationBridge.h"
#import "GrowlSender.h"
#import "PrefsController.h"
@interface AppDelegate : NSObject
{
    IBOutlet PrefsController * prefsController;
	Clip * clip_;
    BOOL growlReady;
    GrowlSender * growl_;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;

@end
