//
//  WelcomeScreenController.h
//  TestForAppToShowHowToUseTabs
//
//  Created by Sid Masih on 6/19/14.
//  Copyright (c) 2014 Sid Masih. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface WelcomeScreenController : UIViewController <NSXMLParserDelegate>

@property(weak, nonatomic) IBOutlet UILabel *eventOne;

@property (weak, nonatomic) IBOutlet UILabel *eventTWO;

@property (weak, nonatomic) IBOutlet UILabel *eventThree;

@property (weak, nonatomic) IBOutlet UILabel *notifcationLabel;

@property (weak, nonatomic) IBOutlet UIButton *notificationLabelButton;
@property (weak, nonatomic) IBOutlet UIButton *websiteButton;

@property (weak, nonatomic) IBOutlet UIImageView *animatedImageView;

@property (weak, nonatomic) IBOutlet UIImageView *BackgroundImageIPhone;

@property (weak, nonatomic) IBOutlet UIButton *CheckForNewDataButton;
@property (weak, nonatomic) IBOutlet UIImageView *EventBoxImmage;
@property (weak, nonatomic) IBOutlet UIImageView *IpadSlideshowShadow;

@end
