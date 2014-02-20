//
//  ASCkViewController.m
//  WhoNeedsCode
//
//  Created by Blaise Rivet on 20/02/2014.
//  Copyright (c) 2014 App Society. All rights reserved.
//

#import "ASCkViewController.h"
@import AVFoundation;

@interface ASCkViewController () <UIDynamicAnimatorDelegate>
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic) BOOL finishedAnimating;
@property (nonatomic) BOOL spokeOnce;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIGravityBehavior *gravity;
@end

@implementation ASCkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // create a UIImage object from image file
    UIImage *image = [UIImage imageNamed:@"ck.png"];
    // create an image view with our image
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    // add image view as a subview to the controller's view
    [self.view addSubview:imageView];
    // hide the image at first
    imageView.hidden = YES;
    // keep a reference to this imageView as a property of our object
    self.imageView = imageView;
    
    
    
    // add UIKit Dynamics behaviour
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator.delegate = self;
    self.finishedAnimating = YES;
}

- (IBAction)tellMeWhatTodayIs:(id)sender {
    // only speak once
    if (!self.spokeOnce) {
        self.spokeOnce = YES;
        
        // create text we want to be spoken
        AVSpeechUtterance *textToSpeak = [[AVSpeechUtterance alloc] initWithString:@"Happy Birthday Daniel !"];
        textToSpeak.rate = AVSpeechUtteranceDefaultSpeechRate / 1.7f;
        
        // initialize an AVSpeechSynthesizer object that is able to play the previous object
        AVSpeechSynthesizer *speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        [speechSynthesizer speakUtterance:textToSpeak];
    }
    
    if (self.finishedAnimating) {
        self.finishedAnimating = NO;
        
        // bring image view back to the top at a random horizontal position
        u_int32_t randomX =  arc4random_uniform(320+1);
        self.imageView.center = CGPointMake((float)randomX, 40.0f);
        self.imageView.hidden = NO;
        
        // apply some physics behaviours to animate
        UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:CGPointMake(160.0f, 370.0f)];
        snap.damping = 0.4f;
        [self.animator addBehavior:snap];
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.imageView]];
        [self.animator addBehavior:gravity];
        gravity.magnitude = 0.45f;
    }
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator*)animator {
	[self.animator removeAllBehaviors];
    self.finishedAnimating = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
