//
//  ViewController.m
//  superTextReplaceFun
//
//  Created by Dan Mindru on 27/02/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *thePlace;
@property (weak, nonatomic) IBOutlet UITextField *theVerb;
@property (weak, nonatomic) IBOutlet UITextField *theNumber;
@property (weak, nonatomic) IBOutlet UITextView *theTemplate;
@property (weak, nonatomic) IBOutlet UITextView *theStory;

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

- (BOOL)textFieldShouldReturn: (UITextField *)textfield{
	[textfield resignFirstResponder];
	return NO;
}

- (IBAction)createStory:(id)sender {
	NSString* temporaryTemplate = self.theTemplate.text;
	temporaryTemplate = [temporaryTemplate stringByReplacingOccurrencesOfString:@"place" withString:self.thePlace.text];
	
	temporaryTemplate = [temporaryTemplate stringByReplacingOccurrencesOfString:@"verb" withString:self.theVerb.text];
	
	temporaryTemplate = [temporaryTemplate stringByReplacingOccurrencesOfString:@"number" withString:self.theNumber.text];
	self.theStory.text = temporaryTemplate;
}

@end
