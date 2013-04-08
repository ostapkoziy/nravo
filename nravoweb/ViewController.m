//
//  ViewController.m
//  nravoweb
//
//  Created by Ostap Koziy on 4/8/13.
//  Copyright (c) 2013 Ostap Koziy. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize webView, bgView, gameLogo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlAddress = SITE_URL;
	NSURL *url = [NSURL URLWithString:urlAddress];
    //Hide web view before first load
    webView.hidden = YES;
    
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];

    //tile the background image
    bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {

	if (navigationType == UIWebViewNavigationTypeLinkClicked) {
		NSURL *requestedUrl = [request URL];
        //Ban all links that lead to unavailable domain
		if(![[requestedUrl host] isEqualToString:AVAILABLE_DOMAIN]){
            return NO;
        }
	}
	return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [UIView animateWithDuration:1.0 animations:^{
        //hide the image
        gameLogo.alpha = 0;
    }
    completion:^(BOOL finished){
        bgView.hidden = YES;
        webView.hidden = NO;
        [webView stringByEvaluatingJavaScriptFromString:HEADER_REMOVE_SCRIPT];
    }];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:CONNECTION_ERROR_MESSAGE
                                                      message:[error localizedDescription]
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
