//
//  DatePickerViewController.m
//  toolbarPop
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "DatePickerViewController.h"
#import "ViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *chosenDate;

@end

@implementation DatePickerViewController

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
	
	//set the datepicker current based on the previous select
	UILabel * chosenDateLabel = [(ViewController*)self.delegate chosenDate];
	
	if(![chosenDateLabel.text isEqualToString:@"no date chosen"]){
		id dateFormat = [self getFormatter];
		NSDate* dateToChange = [dateFormat dateFromString:chosenDateLabel.text];
		self.chosenDate.date = dateToChange;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishDatePick:(id)sender {
	NSDate* dateFromPicker = self.chosenDate.date;
	NSTimeInterval timeDifferenceFromToday;
	//grab the label with todays date
	UILabel* todayDateLabel = [(ViewController*)self.delegate todayDate];
	NSString* todayDateString = todayDateLabel.text;
	
	//grab the result label and result descripton label
	UILabel* resultDescription = [(ViewController*)self.delegate resultDescription];
	UILabel* resultMessage = [(ViewController*)self.delegate resultMessage];
	
	id dateFormat = [self getFormatter];
	NSDate* todayDate = [dateFormat dateFromString:todayDateString];
	timeDifferenceFromToday = [todayDate timeIntervalSinceDate:dateFromPicker] / 86400;
	//round the time difference
	int timeDifferenceRounded = abs(round(timeDifferenceFromToday)+1);
	
	//change the description
	resultDescription.text = @"The difference from today is: ";
	
	//set the value day/days
	NSString* responseText = @"days";
	if(timeDifferenceRounded == 1){
		responseText = @"day";
	}
	
	//change the current day
	UILabel* chosenDateLabel = [(ViewController*)self.delegate chosenDate];
	chosenDateLabel.text = [dateFormat stringFromDate:dateFromPicker];
	
	//change the message
	resultMessage.text = [NSString stringWithFormat:@"%i %@", timeDifferenceRounded, responseText];
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

-(NSFormatter *)getFormatter{
	NSDateFormatter* dateFormat = [NSDateFormatter new];
	[dateFormat setDateStyle:NSDateFormatterMediumStyle];
	[dateFormat setTimeStyle:NSDateFormatterNoStyle];
	
	return dateFormat;
}

@end
