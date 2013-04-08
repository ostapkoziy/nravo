//
//  Constants.m
//  nravoweb
//
//  Created by Ostap Koziy on 4/8/13.
//  Copyright (c) 2013 Ostap Koziy. All rights reserved.
//

#import "Constants.h"

@implementation Constants
NSString *const AVAILABLE_DOMAIN = @"durak.time2play.mobi";
NSString *const SITE_URL = @"http://durak.time2play.mobi/game";
NSString *const CONNECTION_ERROR_MESSAGE = @"Connection error!";
//The t2p banner is the 1st .content element in the DOM, so we remove only it ([0])
NSString *const HEADER_REMOVE_SCRIPT = @"elements = document.getElementsByClassName('content'); elements[0].parentNode.removeChild(elements[0]);";
@end
