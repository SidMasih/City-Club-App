//
//  SecondViewController.h
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/5/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *helpButton;

@end
