//
//  ShopManager.h
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "APBaseModel.h"

@class APShop;

@interface ShopManager : NSObject

+ (ShopManager *)sharedManager;

- (void)setShop:(APShop *)shop;

- (APShop *)shop;

- (BOOL)hasShop;

- (void)updateShop;

- (void)updateShopForced:(BOOL)forced;

@property (strong, nonatomic) APShop *shop;

@end