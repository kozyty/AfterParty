//
//  ShopManager.m
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "ShopManager.h"
#import "UserDefaultsKeys.h"
#import "NANetworkEngine.h"
#import "APAppDelegate.h"
#import "APShop.h"

@interface ShopManager()

@end

@implementation ShopManager

static ShopManager *manager;

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+ (ShopManager *)sharedManager
{
    if (!manager) {
        manager = [ShopManager new];
    }
    return manager;
}

- (void)setShop:(APShop *)shop
{
    if (self.shop != shop) {
        self.shop = shop;
    }
}

- (APShop *)shop
{
    if (!self.shop) {
        [self updateShop];
    }
    return self.shop;
}

- (BOOL)hasShop
{
    return self.shop != nil;
}

- (void)updateShop
{
    [self updateShopForced:NO];
}

- (void)updateShopForced:(BOOL)forced
{
    NSString *latitude = [[NSUserDefaults standardUserDefaults] stringForKey:kUserDefaultsKeyLastLatitude];
    NSString *longitude = [[NSUserDefaults standardUserDefaults] stringForKey:kUserDefaultsKeyLastLongitude];
    NSString *range = [[NSUserDefaults standardUserDefaults] stringForKey:kUserDefaultsKeyLastRange];

    NSDictionary *params = @{
                             @"Latitude": latitude,
                             @"Longitude": longitude,
                             @"Range": range
                             };
    MKNetworkOperation *op = [[NANetworkEngine sharedEngine] operationWithPath:@"" params:params];

    MKNKResponseBlock completionHandler = ^(MKNetworkOperation *op) {
        NSLog(@"%@, %ld, %@", op.url, op.HTTPStatusCode, op.responseString);
        if (op.HTTPStatusCode == 200) {
            APShop *shop = [[APShop alloc] initWithDictionary:op.responseJSON];
            if (shop) {
                [[ShopManager sharedManager] setShop:shop];
            }
        }
    };
    MKNKResponseErrorBlock errorHandler = ^(MKNetworkOperation *op, NSError *error) {
    };
    [op addCompletionHandler:completionHandler errorHandler:errorHandler];
    [[NANetworkEngine sharedEngine] enqueueOperation:op];
}

@end