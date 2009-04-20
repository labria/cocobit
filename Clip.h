//
//  Clip.h
//  BitLy
//
//  Created by Dmitry Krassovski on 20.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Clip : NSObject {
    NSString * string_;
}

- (void)getData;
- (void)setData:(NSString *) string;
@property (nonatomic, retain) NSString * string_;

@end
