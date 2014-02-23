//
//  NANetworkEngine.h
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "MKNetworkKit.h"

@interface NANetworkEngine : MKNetworkEngine

+ (NANetworkEngine *)sharedEngine;

@end