//
//  APBaseModel.h
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

@interface APBaseModel : NSObject

- (id)initWithDictionary:(NSDictionary *)dict;

- (id)objectWithDictionary:(NSDictionary *)dict key:(NSString *)key;
- (int)intValueWithDictionary:(NSDictionary *)dict key:(NSString *)key defaultValue:(int)defaultValue;
- (int)intValueWithDictionary:(NSDictionary *)dict key:(NSString *)key;
- (BOOL)boolValueWithDictionary:(NSDictionary *)dict key:(NSString *)key;

@end