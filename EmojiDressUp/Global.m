//
//  Global.m
//  EmojiDressUp
//
//  Created by Bendt Jensen on 29/10/16.
//  Copyright © 2016 Bendt Jensen. All rights reserved.
//

#import "Global.h"
#import <UIKit/UIKit.h>

@implementation Global

+ (Global *)sharedInstance {
    static dispatch_once_t onceToken;
    static Global *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[Global alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.dressImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"clothes_dress1"],
                              [UIImage imageNamed:@"clothes_dress2"],
                              [UIImage imageNamed:@"clothes_dress3"],
                              [UIImage imageNamed:@"clothes_dress4"],
                              [UIImage imageNamed:@"clothes_dress5"],
                              nil];
        
        self.hairImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"hair_base"],
                               [UIImage imageNamed:@"hair_braids"],
                               [UIImage imageNamed:@"hair_bun"],
                               [UIImage imageNamed:@"hair_curly_long"],
                               [UIImage imageNamed:@"hair_pigtails"],
                               [UIImage imageNamed:@"hair_ponytail"],
                               [UIImage imageNamed:@"hair_straight_long"],
                               nil];
        
        self.thumbDressImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"thumb_clothes_dress1"],
                                [UIImage imageNamed:@"thumb_clothes_dress2"],
                                [UIImage imageNamed:@"thumb_clothes_dress3"],
                                [UIImage imageNamed:@"thumb_clothes_dress4"],
                                [UIImage imageNamed:@"thumb_clothes_dress5"],
                                nil];
        
        self.thumbHairImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"thumb_hair_base"],
                               [UIImage imageNamed:@"thumb_hair_braids"],
                               [UIImage imageNamed:@"thumb_hair_bun"],
                               [UIImage imageNamed:@"thumb_hair_curly_long"],
                               [UIImage imageNamed:@"thumb_hair_pigtails"],
                               [UIImage imageNamed:@"thumb_hair_ponytail"],
                               [UIImage imageNamed:@"thumb_hair_straight_long"],
                               nil];
    }
    
    return self;
}

@end
