//
//  AppDetailDelegateForBlog1.h
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/13/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDetailDelegateForBlog1 : UIViewController

@property (copy, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UINavigationItem *statusLabel;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
