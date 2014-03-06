//
//  ViewController.m
//  realBmi
//
//  Created by Dan Mindru on 20/02/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"
#import "bmiMethods.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *uiScroller;
@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UILabel *bmiDisplay;
@property (weak, nonatomic) IBOutlet UISegmentedControl *heightSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *weightSegmentedControl;
@property BOOL isMale;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.uiScroller setScrollEnabled:true];
	[self.uiScroller setContentSize:CGSizeMake(320, 1000)];
	self.isMale = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//disable keyboard on return/done
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return NO;
}

- (IBAction)touchMaleButton:(id)sender{
	if(self.isMale == false){
		[self changeButtonColor:self.maleButton andType:@"background" andColorChange:@"blue"];
		[self changeButtonColor:self.maleButton andType:@"buttonText" andColorChange:@"white"];
		[self changeButtonColor:self.femaleButton andType:@"background" andColorChange:@"white"];
		[self changeButtonColor:self.femaleButton andType:@"buttonText" andColorChange:@"blue"];

		self.isMale = true;
	}
}

- (IBAction)touchFemaleButton:(id)sender{
	if(self.isMale == true){
		[self changeButtonColor:self.maleButton andType:@"background" andColorChange:@"white"];
		[self changeButtonColor:self.maleButton andType:@"buttonText" andColorChange:@"blue"];
		[self changeButtonColor:self.femaleButton andType:@"background" andColorChange:@"blue"];
		[self changeButtonColor:self.femaleButton andType:@"buttonText" andColorChange:@"white"];
		
		self.isMale = false;
	}
}

- (IBAction)touchCalculate:(id)sender{
	NSString* gender;
	float calculatedBmi;
	if(self.height.text != nil && [self.height.text floatValue]
	   && self.weight.text != nil && [self.weight.text floatValue]){
		
		if(self.isMale){
			gender = @"male";
		}
		else{
			gender = @"female";
		}
		
		calculatedBmi = [bmiMethods calculateBMI:[self.height.text floatValue] andWeight:[self.weight.text floatValue] andHeightType:self.heightSegmentedControl.selectedSegmentIndex andWeightType:self.weightSegmentedControl.selectedSegmentIndex];
		
		self.bmiDisplay.text = [@"Your BMI is " stringByAppendingFormat:@"%.2f",calculatedBmi];
		
		self.result.text = [bmiMethods determineFitLevel:calculatedBmi withGender:gender];
	}
}


- (void)changeButtonColor:(UIButton *)passedOutlet andType:(NSString *)changeType andColorChange:(NSString *)colorChange{
	if([changeType isEqualToString: @"background"]){
		if([colorChange isEqualToString:@"white"]){
			[passedOutlet setBackgroundColor:[UIColor whiteColor]];
		}
		else{
			[passedOutlet setBackgroundColor:[UIColor colorWithRed:0.4 green:0.89803922 blue:1 alpha:1]];
		}
	}
	else if ([changeType isEqualToString: @"buttonText"]){
		if([colorChange isEqualToString:@"white"]){
			[passedOutlet setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		}
		else{
			[passedOutlet setTitleColor:[UIColor colorWithRed:0.4 green:0.89803922 blue:1 alpha:1]forState:(UIControlStateNormal)];
		}
	}
}

@end
