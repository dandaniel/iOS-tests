//
//  ViewController.m
//  programmaticalViewSegues
//
//  Created by Dan Mindru on 06/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"
#import "programmaticView.h"

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

- (IBAction)loadProgramatically:(id)sender {
	UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	programmaticView *newView = [mainStoryboard instantiateViewControllerWithIdentifier:@"progStory"];
	
	newView.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
	newView.modalPresentationStyle=UIModalPresentationFormSheet;
	
	[self presentViewController:newView animated:YES completion:nil];
}

@end
