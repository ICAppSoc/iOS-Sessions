//
//  APSSettingsViewController.h
//  iConverter
//
//  Created by David Harver Pollak on 13/03/14.
//  Copyright (c) 2014 David Harver Pollak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APSRatio.h"

@class APSSettingsViewController;

@protocol APSSettingsViewControllerDelegate <NSObject>
- (void)settingsDidCancel:(APSSettingsViewController *)controller;
- (void)settingsDidSucceedWithRatio:(APSRatio *)ratio inController:(APSSettingsViewController *)controller;
@end

@interface APSSettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *ratioArray;
@property (nonatomic, weak) id <APSSettingsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end
