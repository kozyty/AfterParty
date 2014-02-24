//
//  APShopDetailViewController.h
//  AfterParty
//
//  Created by kozyty on 2014/02/23.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APShopDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *urlStr;

@end
