//
//  APViewController.m
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "APViewController.h"
#import "NANetworkEngine.h"
#import "UserDefaultsKeys.h"
#import "ShopManager.h"
#import "APShop.h"
#import "ShoCollectionCell.h"
#import "XMLConverter.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface APViewController ()

@end

@implementation APViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 位置情報取得開始
    locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager.delegate = self;
        [locationManager startUpdatingLocation];
    }
    
    // 地図の拡大とスクロールは拒否
    self.mapView.zoomEnabled = NO;
    self.mapView.scrollEnabled = NO;
//    [[ShopManager sharedManager] shop];

    self.isUpdate = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (self.isUpdate) {
        CLLocation *lastLocation = [locations lastObject];
        lastLatitude =  lastLocation.coordinate.latitude;
        lastLongitude = lastLocation.coordinate.longitude;
        
        [[NSUserDefaults standardUserDefaults] setObject:@"35.6593685658" forKey:kUserDefaultsKeyLastLatitude];
        [[NSUserDefaults standardUserDefaults] setObject:@"139.7769770318" forKey:kUserDefaultsKeyLastLongitude];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSDictionary *params = @{
                                 @"key": @"71d4fc37e5ea9971",
                                 @"Latitude": @"35.6593685658",
                                 @"Longitude": @"139.7769770318",
                                 @"Count" : [NSString stringWithFormat:@"%d", 20],
                                 @"Range": [NSString stringWithFormat:@"%d", 3]
                                 };
        MKNetworkOperation *op = [[NANetworkEngine sharedEngine] operationWithPath:@"" params:params];
        
        MKNKResponseBlock completionHandler = ^(MKNetworkOperation *op) {
            NSLog(@"%@, %ld, %@", op.url, op.HTTPStatusCode, op.responseString);
            if (op.HTTPStatusCode == 200) {
                [XMLConverter convertXMLData:op.responseData completion:^(BOOL success, NSMutableDictionary *dictionary, NSError *error) {
                    NSDictionary *results = [dictionary valueForKey:@"Results"];
                    NSArray *shops = [results valueForKey:@"Shop"];
                    NSMutableArray *apShops = [NSMutableArray array];
                    for (NSDictionary *array in shops) {
                        NSDictionary *shop = @{
                                               @"name": [array valueForKey:@"ShopName"],
                                               @"open": [array valueForKey:@"Open"],
                                               @"partyCapacity": [array valueForKey:@"PartyCapacity"],
                                               @"freeDrink": [array valueForKey:@"FreeDrink"],
                                               @"url": [array valueForKey:@"ShopUrl"],
                                               @"image": [[array valueForKey:@"PictureUrl"] valueForKey:@"PcLargeImg"]
                                               };
                        APShop *apShop = [[APShop alloc] initWithDictionary:shop];
                        [apShops addObject:apShop];
                    }
                    self.shops = apShops;
                }];
            }
        };
        MKNKResponseErrorBlock errorHandler = ^(MKNetworkOperation *op, NSError *error) {
            NSLog(@"%s", __func__);
        };
        [op addCompletionHandler:completionHandler errorHandler:errorHandler];
        [[NANetworkEngine sharedEngine] enqueueOperation:op];
        
        NSLog(@"%s %@ - %f / %f", __func__, lastLocation, lastLatitude, lastLongitude);
        
        MKCoordinateRegion region = self.mapView.region;
        
        region.center.latitude = lastLatitude;
        region.center.longitude = lastLongitude;
        
        region.span.latitudeDelta = zoom_lv;
        region.span.longitudeDelta = zoom_lv;
        
        [self.mapView setRegion:region animated:YES];
        
        MKPointAnnotation* pin = [[MKPointAnnotation alloc] init];
        pin.coordinate = CLLocationCoordinate2DMake(lastLatitude, lastLongitude);
        [self.mapView addAnnotation:pin];
        
        self.isUpdate = NO;
    }
    
//    if (self.shops) {
//        APShop *lastShop = [self.shops lastObject];
//        self.nameLabel.text = lastShop.name;
//        self.openLabel.text = lastShop.open;
//        self.capacityLabel.text = lastShop.partyCapacity;
//        self.freeDrinkLabel.text = lastShop.freeDrink;
//        [self.imageView setImageWithURL:[NSURL URLWithString:lastShop.image]];
//    }
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    return [self.shops count];
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ShoCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"ShopCell" forIndexPath:indexPath];
    
    if (self.shops) {
        APShop *shop = [self.shops objectAtIndex:indexPath.row];
        cell.nameLabel.text = shop.name;
        cell.openLabel.text = shop.open;
        cell.capacityLabel.text = shop.partyCapacity;
        cell.freeDrinkLabel.text = shop.freeDrink;
        [cell.imageView setImageWithURL:[NSURL URLWithString:shop.image]];

    }

    return cell;
}

- (IBAction)onClickButton:(id)sender {
//    UISegmentedControl *control = sender;
//    switch (control.selectedSegmentIndex) {
//        case 0:
//            zoom_lv = 0.005f;
//            break;
//        case 1 :
//            zoom_lv = 0.05f;
//            break;
//        case 2:
//            zoom_lv = 0.5f;
//            break;
//        case 3:
//            zoom_lv = 1.0f;
//            break;
//    }
//    
//    MKCoordinateRegion region = self.mapView.region;
//    
//    region.center.latitude = lastLatitude;
//    region.center.longitude = lastLongitude;
//    
//    region.span.latitudeDelta = zoom_lv;
//    region.span.longitudeDelta = zoom_lv;
//    
//    [self.mapView setRegion:region animated:YES];
}

@end
