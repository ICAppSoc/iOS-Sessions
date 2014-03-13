//
//  APSViewController.h
//  iConverter
//
//  Created by David Harver Pollak on 13/03/14.
//  Copyright (c) 2014 David Harver Pollak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APSSettingsViewController.h"

@interface APSViewController : UIViewController <APSSettingsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fromField;
@property (weak, nonatomic) IBOutlet UITextField *toField;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;

@end