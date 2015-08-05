//
//  DetailViewControllerForBlog2.m
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/16/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import "DetailViewControllerForBlog2.h"

@interface DetailViewControllerForBlog2 (){
    UIColor *myColor;
}

@end

@implementation DetailViewControllerForBlog2


- (void)viewDidLoad
{
    #pragma mark - Managing the detail item
    
        [super viewDidLoad];
        
        // converts encoded string into NSURL object
        
    float r=100.0/255.0;
    float g = 149.0/255.0;
    float b =224.0/255.0;
    float o = 1.0;
    
    myColor = [[UIColor alloc] init];
    myColor =[UIColor colorWithRed: r green: g blue: b alpha: o ];
    
    [self.view setBackgroundColor: myColor];

    
        
        NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
        //dd
        
        
        
        NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
        
        
        [self.webView loadRequest:request];
        
        
        
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
