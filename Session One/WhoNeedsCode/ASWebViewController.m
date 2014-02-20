//
//  ASWebViewController.m
//  WhoNeedsCode
//
//  Created by Imperial App Society on 10/02/2014.
//

#import "ASWebViewController.h"

@interface ASWebViewController ()
@property(nonatomic, strong) IBOutlet UIWebView *webView;
@end

@implementation ASWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Thank you Apple, we shall:
    NSString *urlAddress = @"http://www.google.co.uk";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
