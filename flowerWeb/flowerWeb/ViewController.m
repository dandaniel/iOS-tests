//
//  ViewController.m
//  flowerWeb
//
//  Created by Dan Mindru on 05/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (weak, nonatomic) IBOutlet UIWebView *flowerView;
@property (weak, nonatomic) IBOutlet UIWebView *flowerDetailView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.flowerDetailView.hidden = YES;
	[self getFlower:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getFlower:(id)sender {
	NSURL *imageURL;
	NSURL *detailURL;
	NSString *imageURLString;
	NSString *detailURLString;
	NSString *color;
	int sessionID;
	
	color =[self.colorChoice titleForSegmentAtIndex: self.colorChoice.selectedSegmentIndex];
	sessionID = random()%50000;
	imageURLString = [NSString stringWithFormat:@"http://www.floraphotographs.com/showrandomios.php?color=%@&session=%d", color, sessionID];
	detailURLString = [NSString stringWithFormat:@"http://www.floraphotographs.com/detailios.php?session=%d", sessionID];
	
	imageURL = [NSURL URLWithString:imageURLString];
	detailURL = [NSURL URLWithString:detailURLString];
	
	[self.flowerView loadRequest:[NSURLRequest requestWithURL:imageURL]];
	[self.flowerDetailView loadRequest:[NSURLRequest requestWithURL:detailURL]];
}

- (IBAction)toggleFlowerDetail:(id)sender {
	self.flowerDetailView.hidden = ![sender isOn];
}

@end