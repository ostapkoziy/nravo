//
//  ViewController.h
//  nravoweb
//
//  Created by Ostap Koziy on 4/8/13.
//  Copyright (c) 2013 Ostap Koziy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIImageView *bgView;
@property (strong, nonatomic) IBOutlet UIImageView *gameLogo;

@end
