//
//  AppDelegate.h
//  CocoBit
//
//  Created by Dmitry Krassovski on 28.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import "Clip.h"
#import "./Growl.framework/Headers/GrowlApplicationBridge.h"
@interface AppDelegate : NSObject <GrowlApplicationBridgeDelegate>
{
@public
	Clip * clip_;
    BOOL growlReady;
    NSArray *priorities_;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
- (void)initializeGrowl;
- (void)growlString:(NSString *) string;
@end
