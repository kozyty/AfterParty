//
//  NANetworkEngine.m
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "NANetworkEngine.h"
#import "NetworkUtil.h"

@interface NANetworkEngine()

@end

@implementation NANetworkEngine

static NANetworkEngine *sharedEngine;

+ (NANetworkEngine *)sharedEngine
{
    if (!sharedEngine) {
        NSDictionary *header = @{
                                 @"User-Agent" : [NetworkUtil userAgent]
                                 };
        NSString *host = @"api.hotpepper.jp";
        sharedEngine = [[NANetworkEngine alloc] initWithHostName:host
                                                         apiPath:@"GourmetSearch/V110"
                                              customHeaderFields:header];
        [sharedEngine useCache];
    }
    return sharedEngine;
}

- (void)enqueueOperation:(MKNetworkOperation *)operation forceReload:(BOOL)forceReload
{
    [super enqueueOperation:operation forceReload:forceReload];
}

-(MKNetworkOperation*) operationWithPath:(NSString*) path
                                  params:(NSDictionary*) body {

    MKNetworkOperation *op = [super operationWithPath:path
                                               params:body];
    op.shouldNotCacheResponse = YES;
    return op;
}

@end
