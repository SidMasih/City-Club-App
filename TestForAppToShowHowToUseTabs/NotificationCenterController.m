//
//  NotificationCenterController.m
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/22/14.
//  Copyright (c) 2015 Sid Masih. All rights reserved.
//

#import "NotificationCenterController.h"
@interface NotificationCenterController (){
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
    int notiLimit;
}
@end

@implementation NotificationCenterController

-(instancetype) init {
    self = [super init];
    if (self){
        feeds = [[NSMutableArray alloc] init];
        
        
        // calls rss feed url
        NSURL *url = [NSURL URLWithString:@"http://notificationsba014.blogspot.com/feeds/posts/default?alt=rss"];
        
        
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        
        
        [parser parse];

    }
    else{
        NSLog(@"init failed for Notification Controller");
    }
    
    return self;
}


- (void) runNotification:(Boolean)status{
    if (status && notiLimit < 2) {
        NSLog(@"notification profess atarted");
        
        if ([feeds count] == 0) {
            NSLog(@"no new notifications");
        } else {
            _messageNotification = [[UILocalNotification alloc] init];
            _messageNotification.alertBody = [[feeds objectAtIndex:0] objectForKey: @"title"];
            _messageNotification.fireDate =[NSDate dateWithTimeIntervalSinceNow:3];
            _messageNotification.applicationIconBadgeNumber = 0;
            _messageNotification.soundName = UILocalNotificationDefaultSoundName;
            _messageNotification.timeZone = [NSTimeZone defaultTimeZone];
            
            
            [[UIApplication sharedApplication] scheduleLocalNotification:_messageNotification];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];

        }
    }
    else{
        NSLog(@"Notification not set");
    }
   
}

- (NSString *) getMessage :(Boolean) status{
 
    if (status && ![feeds count] == 0) {
       
        NSString *messageString = [[feeds objectAtIndex:0] objectForKey: @"title"];
        
        if (messageString == nil) {
            return @"no new message";
        }
        
        else{
            return messageString;
        }
    }
    
    else{
       return @"no new message";
    }
    
    return @"system error";
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
    
    if ([elementName isEqualToString:@"item"]  && notiLimit <1) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        
        [feeds addObject:[item copy]];
        notiLimit++;
        
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
    
}



@end
