//
//  ViewController.m
//  toolbarPop
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.todayDate.text= [NSString stringWithFormat:@"%@", [self displayToday]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)displayToday{
	NSDate* today = [NSDate date];
	NSDateFormatter* todayFormat = [NSDateFormatter new];
	[todayFormat setDateStyle:NSDateFormatterMediumStyle];
	[todayFormat setTimeStyle:NSDateFormatterNoStyle];
	return [todayFormat stringFromDate:today];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	((DatePickerViewController *)segue.destinationViewController).delegate =self;
}

@end
