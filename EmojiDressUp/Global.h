//
//  Global.h
//  EmojiDressUp
//
//  Created by Bendt Jensen on 29/10/16.
//  Copyright © 2016 Bendt Jensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject

+ (Global *)sharedInstance;

@property (strong, nonatomic, readwrite) NSArray *dressImageArray;
@property (strong, nonatomic, readwrite) NSArray *hairImageArray;
@property (strong, nonatomic, readwrite) NSArray *thumbDressImageArray;
@property (strong, nonatomic, readwrite) NSArray *thumbHairImageArray;

@end
