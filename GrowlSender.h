//
//  GrowlSender.h
//  CocoBit
//
//  Created by Dmitry Krassovski on 28.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "./Growl.framework/Headers/GrowlApplicationBridge.h"

@interface GrowlSender : NSObject  <GrowlApplicationBridgeDelegate>
{
@public
    BOOL growlReady;
}
- (void)initializeGrowl;
- (void)growlString:(NSString *) string;
@end
