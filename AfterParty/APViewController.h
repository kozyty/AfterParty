//
//  APViewController.h
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

@interface APViewController : UIViewController <CLLocationManagerDelegate, UICollectionViewDelegate> {
    CLLocationManager *locationManager;
    int apiRange;
    double zoom_lv;
    double lastLatitude;
    double lastLongitude;
}

/// マップ
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

/// 横スクロールコレクションビュー
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

/// コレクションビューセル
@property (weak, nonatomic) IBOutlet UICollectionViewCell *collectionViewCell;

/// 右スライドボタン
@property (weak, nonatomic) IBOutlet UIButton *rightSlideButton;

/// 左スライドボタン
@property (weak, nonatomic) IBOutlet UIButton *leftSlideButton;

/// お店一覧
@property (strong, nonatomic) NSMutableArray *shops;

@property (assign, nonatomic) BOOL isUpdate;

/// ボタンクリックアクション
- (IBAction)onClickButton:(id)sender;


@end
