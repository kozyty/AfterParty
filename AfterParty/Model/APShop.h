//
//  APShop.h
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "APBaseModel.h"

@interface APShop : APBaseModel

/// 店名
@property (strong, nonatomic) NSString *name;

/// 営業時間
@property (strong, nonatomic) NSString *open;

/// 収容数
@property (strong, nonatomic) NSString *partyCapacity;

/// 飲み放題
@property (strong, nonatomic) NSString *freeDrink;

/// 禁煙席
@property (strong, nonatomic) NSString *nonSmoking;

/// サイトURL
@property (strong, nonatomic) NSString *url;

/// 画像URL
@property (strong, nonatomic) NSString *image;

+ (NSMutableArray *)shopsListWithArray:(NSArray *)array;

@end