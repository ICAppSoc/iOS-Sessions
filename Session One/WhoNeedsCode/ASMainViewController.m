//
//  ASMainViewController.m
//  WhoNeedsCode
//
//  Created by Imperial App Society on 10/02/2014.
//

#import "ASMainViewController.h"

@interface ASMainViewController ()

@end

@implementation ASMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

// this method makes Xcode understand that you want an unwind segue (a transition for "getting back") in the storyboard going towards this controller
- (IBAction)unwindToMainMenu:(UIStoryboardSegue *)segue {
    
}

// one of the Text Field delegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // this has the consequence of dismissing the keyboard
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
