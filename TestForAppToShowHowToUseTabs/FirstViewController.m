//
//  FirstViewController.m
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/5/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDetailDelegateForBlog1.h"

@interface FirstViewController (){
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
    int cellLimit;
    Boolean notiSwitch ;
    UIColor *myColor;
}


@end

@implementation FirstViewController
//colorWithPatternImage:[UIImage imageNamed:@"Default@2x.png"] used to change bacground pic, MAKAE IT WORK

- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (void)viewDidLoad {
    NSLog(@"View loaded");
    [super viewDidLoad];
    
    float r=100.0/255.0;
    float g = 149.0/255.0;
    float b =234.0/255.0;
    float o = 1.0;

    
    myColor = [[UIColor alloc] init];
    myColor =[UIColor colorWithRed: r green: g blue: b alpha: o ];
    
    [self.view setBackgroundColor: myColor];
    [self.tableView setBackgroundColor: myColor ];

    
    
    //sets background immage to earth
    //[self.view setBackgroundColor: UIColor.darkGrayColor];
    //[self.tableView setBackgroundColor: UIColor.darkGrayColor ];
    
    // launch notification
        
   
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
  //  [self.tableView setBackgroundColor:UIColor.whiteColor];
    
    feeds = [[NSMutableArray alloc] init];
    
    
    // calls rss feed url
    NSURL *url = [NSURL URLWithString:@"http://eventsba0124.blogspot.com/feeds/posts/default?alt=rss"];
    
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    
    
    [parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feeds.count;
}



// sets the individual cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey: @"title"];
    
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
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
    
    if ([elementName isEqualToString:@"item"] && cellLimit <5) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        
        [feeds addObject:[item copy]];
        cellLimit++;
        
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        cellLimit=0;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *string = [feeds[indexPath.row] objectForKey: @"link"];
        [[segue destinationViewController] setUrl:string];
        
        //update app feeds
        //sets background immage to earth:  [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Default.png"]]];
        
        [self.tableView setBackgroundColor: myColor];
        
        feeds = [[NSMutableArray alloc] init];
        
        
        // calls rss feed url
        NSURL *url = [NSURL URLWithString:@"http://eventsba0124.blogspot.com/feeds/posts/default?alt=rss"];
        
        
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
        
        
    }
    
}

- (IBAction)help:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc]
                             initWithTitle:@"Event Help" message:@"New scheduled events will appear here. Please click the event to view more details and reserve seating" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [theAlert show];
}





@end
