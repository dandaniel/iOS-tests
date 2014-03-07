//
//  ViewController.m
//  seguesNotSegways
//
//  Created by Dan Mindru on 06/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"
#import "secondaryPage.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
	//automatically start segue
	//[self performSegueWithIdentifier:@"goToSecond" sender:self];
}

- (IBAction)exitToFirst:(UIStoryboardSegue *)sender{
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	secondaryPage* destinationView;
	ViewController* startingView;
	
	startingView = (ViewController *)segue.sourceViewController;
	destinationView = (secondaryPage *)segue.destinationViewController;
	
	NSLog(@"Segue: %@", segue.identifier);
	
	((secondaryPage *)self.presentedViewController).labelToChangeTwo.text = @"Changed";
	
	NSLog(@"Destination view: %@", destinationView);
	NSLog(@"Destination view controller: %@", ((secondaryPage *)self.presentedViewController));
}

@end
