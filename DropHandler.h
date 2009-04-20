//
//  DropHandler.h
//  CocoBit
//
//  Created by Dmitry Krassovski on 21.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DropHandler : NSObject {
    
}

- (void)shortenURL:(NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error;

@end
