//
//  NotificationCenterController.h
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/22/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NotificationCenterController : NSObject <NSXMLParserDelegate>

@property(nonatomic, strong) UILocalNotification *messageNotification;

- (void) runNotification : (Boolean) status;
- (NSString *) getMessage :(Boolean) status;
@end