//
//  APBaseModel.m
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "APBaseModel.h"

@implementation APBaseModel

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (!dict) {
        return nil;
    }
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)objectWithDictionary:(NSDictionary *)dict key:(NSString *)key
{
    id obj = nil;
    if ([dict isKindOfClass:[NSDictionary class]]) {
        obj = [dict objectForKey:key];
        if (obj == [NSNull null]) {
            obj = nil;
        }
    }
    return obj;
}

- (int)intValueWithDictionary:(NSDictionary *)dict key:(NSString *)key defaultValue:(int)defaultValue
{
    id obj = [self objectWithDictionary:dict key:key];
    if (obj) {
        return [obj intValue];
    }
    return defaultValue;
}

- (int)intValueWithDictionary:(NSDictionary *)dict key:(NSString *)key
{
    return [self intValueWithDictionary:dict key:key defaultValue:0];
}

- (BOOL)boolValueWithDictionary:(NSDictionary *)dict key:(NSString *)key
{
    id obj = [self objectWithDictionary:dict key:key];
    if (obj) {
        return [obj boolValue];
    }
    return NO;
}

@end