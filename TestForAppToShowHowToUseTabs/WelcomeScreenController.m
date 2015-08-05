//
//  WelcomeScreenController.m
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/19/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import "WelcomeScreenController.h"
#import "NotificationCenterController.h"

@interface WelcomeScreenController (){
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
    UIColor *myColor;
    

}

@end

@implementation WelcomeScreenController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
 //   [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"Applcon.png"] forBarMetrics:UIBarMetricsDefault];
    // logo color is (r,b,g) (1,0,102)
    
    //set colors
    
    float r = 218.0/255.0;
    float g = 221.0/255.0;
    float b = 239.0/255.0;
    float o = 1.0;
    
    myColor = [[UIColor alloc] init];
    myColor =[UIColor colorWithRed: r green: g blue: b alpha: o ];
    
    [self.view setBackgroundColor: myColor];
    
    self.EventBoxImmage.alpha = .30;
    self.IpadSlideshowShadow.alpha=.25;
    self.notificationLabelButton.alpha=.85;
    self.websiteButton.alpha = .85;
    self.CheckForNewDataButton.alpha=.85;
   
    
    //Animated images for Ipad!
    self.animatedImageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"Applcon.png"],nil];
    
    self.animatedImageView.animationDuration = 10.0;
    self.animatedImageView.animationRepeatCount = 0;
    [self.view addSubview:self.animatedImageView];
    [self.animatedImageView startAnimating];
    // end Animated images for ipad
    

    
    //start feeds
    feeds = [[NSMutableArray alloc] init];

    // calls rss feed url
    NSURL *url = [NSURL URLWithString:@"http://eventsba0124.blogspot.com/feeds/posts/default?alt=rss"];
    
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    
    
    [parser parse];
    
    NSString *str1 = @"1: ";
    NSString *str2 = @"2: ";
    NSString *str3 = @"3: ";

    if ([feeds count] == 3|| [feeds count] >3) {
        _eventOne.text =  [str1 stringByAppendingString:[[feeds objectAtIndex:0] objectForKey: @"title"]];
        _eventTWO.text = [ str2 stringByAppendingString:[[feeds objectAtIndex:1] objectForKey: @"title"] ];
        _eventThree.text = [ str3 stringByAppendingString:[[feeds objectAtIndex:2] objectForKey: @"title"] ];

    }
   
    else if ([feeds count] == 2){
        _eventOne.text =  [str1 stringByAppendingString:[[feeds objectAtIndex:0] objectForKey: @"title"]];
        _eventTWO.text = [ str2 stringByAppendingString:[[feeds objectAtIndex:1] objectForKey: @"title"] ];
        _eventThree.text =@"";
    }
    else if ([feeds count] == 1){
        _eventOne.text =  [str1 stringByAppendingString:[[feeds objectAtIndex:0] objectForKey: @"title"]];
        _eventTWO.text = @"";
        _eventThree.text =@"";

    }
    else{
        _eventOne.text = @"No internet connection!";
        _eventTWO.text = @"App will not function!";
        _eventThree.text =@"Please try again later! ";
        
        UIAlertView *theAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Error" message:@"Warning! No internet connection, the app will not function\nPlease try again later when connected to the internet" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
        [theAlert show];
    }
    // message function
    
    //popup with notification info
    NotificationCenterController *notiCon = [[NotificationCenterController alloc] init];
    NSString *notiString =[notiCon getMessage:YES];
    
    
    if([notiString isEqualToString:@"no new message"]){
        NSLog(@"no notifications");
    }
    else  {
        UIAlertView *theAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Notification" message:notiString delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
        [theAlert show];
        
    }
    

    
     _notifcationLabel.text = [notiCon getMessage:YES];
    
       
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        
    }
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"] ) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        
        [feeds addObject:[item copy]];
       
        
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
    
}

//launch to website
- (IBAction)websiteButtonClicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.cityclubofsandiego.com/"];
    
    if (![[UIApplication sharedApplication] openURL:url])
        NSLog(@"%@%@",@"Failed to open website url:",[url description]);
}

- (IBAction)moreInfoOnNotification:(id)sender {
    NotificationCenterController *notiCon = [[NotificationCenterController alloc] init];
    NSString *notiString =[notiCon getMessage:YES];
    UIAlertView *theAlert = [[UIAlertView alloc]
                             initWithTitle:@"Notification" message:notiString delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [theAlert show];
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
// _notifcationLabel.text = [notiCon getMessage:YES];
@end
