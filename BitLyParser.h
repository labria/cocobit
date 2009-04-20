//
//  BitLyParser.h
//  BitLy
//
//  Created by Dmitry Krassovski on 19.04.09.
//  Copyright 2009 Getalime. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface BitLyParser : NSObject {
    NSString * longURL_;
    NSString * shortURL_;
    NSString * xmlData_;
    NSURL * queryURL_;
}

+ (id)newWithURLFromString:(NSString *) url;
- (id)initWithURLFromString:(NSString *) url;
- (void)getData;
- (id)parseXML;
@property (nonatomic, retain) NSString * longURL_;
@property (nonatomic, retain) NSString * shortURL_;
@property (nonatomic, retain) NSString * xmlData_;
@property (nonatomic, retain) NSURL * queryURL_;

@end
