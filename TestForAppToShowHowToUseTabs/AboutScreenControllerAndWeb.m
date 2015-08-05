//
//  AboutScreenControllerAndWeb.m
//  San Diego City Club
//
//  Created by Sid Masih on 6/24/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import "AboutScreenControllerAndWeb.h"
@interface AboutScreenControllerAndWeb ()

@end


@implementation AboutScreenControllerAndWeb

- (void)viewDidLoad
{
#pragma mark - Managing the detail item
    
    
    NSURL *myURL = [NSURL URLWithString:@"http://cityclubabout.blogspot.com/2014/07/about.html?m=1"];
    //dd
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [super viewDidLoad];
    
    // converts encoded string into NSURL object
    
    
    
    

    
    
    [self.webView loadRequest:request];
     NSLog(@"reached about biew load");
   
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)contactINfo:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc]
                             initWithTitle:@"Contact Info" message:@"The City Club of San Diego\nPO Box 16450\nSan Diego, California 92176\nPhone: 619-235-4041\nFax: 619-235-9511\nTelephone Event Reservations: 619-687-3580\nEmail:\nCityclubsd@gmail.com" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [theAlert show];
} 
- (IBAction)appInfo:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc]
                             initWithTitle:@"About App" message:@"City Club App: Version 1.0\n Head Programmer and Layout Design: Sid Masih\n User Interface/Graphic Design: Cameron Khoroushi\nCopyright (c) 2014 City Club of San Diego & Sid Masih & Cameron Khoroushi. All rights reserved.\n\n Internet Connection Required!\n If experiencing errors please check your connection." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [theAlert show];
}



@end
