//
//  DetailViewControllerForBlog2.h
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/16/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewControllerForBlog2 : UIViewController


@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end
