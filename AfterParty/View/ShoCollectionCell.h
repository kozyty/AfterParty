//
//  ShoCollectionCell.h
//  AfterParty
//
//  Created by kozyty on 2014/02/23.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoCollectionCell : UICollectionViewCell

/// 背景画像
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


/// webViewボタン
@property (weak, nonatomic) IBOutlet UIButton *webButton;

/// 店名ラベル
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/// 営業時間ラベル
@property (weak, nonatomic) IBOutlet UILabel *openLabel;

/// 収容人数ラベル
@property (weak, nonatomic) IBOutlet UILabel *capacityLabel;

/// 飲み放題ラベル
@property (weak, nonatomic) IBOutlet UILabel *freeDrinkLabel;

/// カラオケラベル
@property (weak, nonatomic) IBOutlet UILabel *karaokeLabel;

/// 禁煙席
@property (weak, nonatomic) IBOutlet UILabel *nonSmokingLabel;

/// webUrl
@property (strong, nonatomic) NSString *url;

- (IBAction)onClickButton:(id)sender;
@end
