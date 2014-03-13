//
//  APSViewController.m
//  iConverter
//
//  Created by David Harver Pollak on 13/03/14.
//  Copyright (c) 2014 David Harver Pollak. All rights reserved.
//

#import "APSViewController.h"

@interface APSViewController ()
@property (nonatomic, strong) APSRatio *currentRatio;
@property (nonatomic, assign) BOOL firstLaunch;
@end

@implementation APSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.firstLaunch = YES;
    [self addNotifications];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.firstLaunch) {
        [self openSettings];
        self.firstLaunch = NO;
    } else {
        [self.fromField becomeFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - void

- (void)openSettings {
    [self performSegueWithIdentifier:@"settings" sender:self];
}

- (void)addNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fromDidChange:) name:UITextFieldTextDidChangeNotification object:self.fromField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toDidChange:) name:UITextFieldTextDidChangeNotification object:self.toField];
}

- (void)fromDidChange:(NSNotification *)notification {
    self.toField.text = [NSString stringWithFormat:@"%.2f", self.fromField.text.floatValue * self.currentRatio.ratio];
}

- (void)toDidChange:(NSNotification *)notification {
    self.fromField.text = [NSString stringWithFormat:@"%.2f", self.toField.text.floatValue * (1 / self.currentRatio.ratio)];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"settings"]) {
        APSSettingsViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}

#pragma mark - APSSettingsViewControllerDelegate

- (void)settingsDidSucceedWithRatio:(APSRatio *)ratio inController:(APSSettingsViewController *)controller {
    self.currentRatio = ratio;
    self.fromLabel.text = self.currentRatio.fromName;
    self.toLabel.text = self.currentRatio.toName;
}

- (void)settingsDidCancel:(APSSettingsViewController *)controller {
    NSLog(@"Cancel");
}

@end
