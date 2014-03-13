//
//  APSSettingsViewController.m
//  iConverter
//
//  Created by David Harver Pollak on 13/03/14.
//  Copyright (c) 2014 David Harver Pollak. All rights reserved.
//

#import "APSSettingsViewController.h"

@interface APSSettingsViewController ()

@end

@implementation APSSettingsViewController

@synthesize ratioArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    APSRatio *ratio1 = [[APSRatio alloc] init];
    ratio1.fromName=@"Kilos";
    ratio1.toName = @"Lb";
    ratio1.ratio = 2.20462;
    
    APSRatio *ratio2 = [[APSRatio alloc] init];
    ratio2.fromName = @"Euro";
    ratio2.toName = @"Sterling";
    ratio2.ratio = 0.84;
    
    ratioArray = [[NSArray alloc] initWithObjects:ratio1, ratio2, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)cancel:(id)sender {
    [self.delegate settingsDidCancel:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ratioArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    APSRatio *matthew = ratioArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ / %@", matthew.fromName, matthew.toName];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    APSRatio *matthew = ratioArray[indexPath.row];
    
    [self.delegate settingsDidSucceedWithRatio:matthew inController:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
