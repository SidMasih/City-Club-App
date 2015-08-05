//
//  AboutScreenControllerAndWeb.h
//  San Diego City Club
//
//  Created by Sid Masih on 6/24/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AboutScreenControllerAndWeb : UIViewController

@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
