//
//  XMLConverter.h
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLConverter : NSObject

typedef void (^OutputBlock)(BOOL success, NSMutableDictionary *dictionary, NSError *error);

+ (void)convertXMLString:(NSString *)string completion:(OutputBlock)completion;

+ (void)convertXMLFile:(NSString *)filePath completion:(OutputBlock)completion;

+ (void)convertXMLData:(NSData *)data completion:(OutputBlock)completion;

+ (void)convertXMLURL:(NSURL *)url completion:(OutputBlock)completion;

+ (void)convertXMLStream:(NSInputStream *)stream completion:(OutputBlock)completion;

@end