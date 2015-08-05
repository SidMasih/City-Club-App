//
//  AppDetailDelegateForBlog1.m
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/13/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import "AppDetailDelegateForBlog1.h"


@implementation AppDetailDelegateForBlog1

//#pragma mark - Managing the detail item

- (void)viewDidLoad

{
    
    [super viewDidLoad];
    _statusLabel.title = @"Loading";
    // converts encoded string into NSURL object
    
    
  
    
    NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    //dd
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    

    [self.webView loadRequest:request];
    
    _statusLabel.title = @"finnished loading";
    _statusLabel.title = @"More Information";
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
/*
 
 
 [super viewDidLoad];
 NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding:
 NSUTF8StringEncoding]];
 NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
 [self.webView loadRequest:request];
 
*/