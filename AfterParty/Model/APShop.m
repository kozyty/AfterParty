//
//  APShop.m
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "APShop.h"

#define kKeyName                        @"name"
#define kKeyOpen                        @"open"
#define kKeyPartyCapacity               @"partyCapacity"
#define kKeyFreeDrink                   @"freeDrink"
#define kKeyNonSmoking                  @"nonSmoking"
#define kKeyUrl                         @"url"
#define kKeyImage                       @"image"

@implementation APShop

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super initWithDictionary:dict];
    if (self) {
        self.name = [self objectWithDictionary:dict  key:kKeyName];
        self.open = [self objectWithDictionary:dict  key:kKeyOpen];
        self.partyCapacity = [self objectWithDictionary:dict  key:kKeyPartyCapacity];
        self.freeDrink = [self objectWithDictionary:dict  key:kKeyFreeDrink];
        self.nonSmoking = [self objectWithDictionary:dict  key:kKeyNonSmoking];
        self.url = [self objectWithDictionary:dict  key:kKeyUrl];
        self.image = [self objectWithDictionary:dict  key:kKeyImage];
    }
    return self;
}

+ (NSMutableArray *)shopsListWithArray:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        APShop *shop = [[APShop alloc] initWithDictionary:dict];
        if (shop) {
            [result addObject:shop];
        }
    }
    return result;
}

@end