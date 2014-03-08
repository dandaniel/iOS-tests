//
//  ViewController.m
//  gettingAttention
//
//  Created by Dan Mindru on 05/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"
#import "alertTouches.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userOutput;

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

- (void)updateLabelText:(NSString *)newText{
	self.userOutput.text = newText;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	//comment this out to try output label.. -> updateLabelText:
	NSString * buttonTitle = [alertView	buttonTitleAtIndex:buttonIndex];
	
	if([buttonTitle isEqualToString:@"Do this"]){
		self.userOutput.text = @"Did this";
	}
	else if([buttonTitle isEqualToString:@"Do that"]){
		self.userOutput.text = @"Did that";
	}
	
	if([alertView.title isEqualToString:@"Alert with inputs"]){
		self.userOutput.text = [NSString stringWithFormat:@"U: %@, P: %@", [[alertView textFieldAtIndex:0] text], [[alertView textFieldAtIndex:1] text]];
	}
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	NSString* buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
	
	if([buttonTitle isEqualToString:@"Delete"]){
		self.userOutput.text= @"Deleted";
	}
	else if([buttonTitle isEqualToString:@"Edit"]){
		self.userOutput.text=@"Edited";
	}
	else if([buttonTitle isEqualToString:@"Move"]){
		self.userOutput.text =@"Moved";
	}
	else{
		self.userOutput.text=@"Canceled";
	}
}

- (IBAction)doAlert:(id)sender {
	UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc] initWithTitle:@"Alert Button Touched" message:@"Alerts are useless" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	
	[alertDialog show];
}

- (IBAction)doMultiButtonAlert:(id)sender {
	UIAlertView *alertDialog;
	//delegate:[alertTouches class]
	
	alertDialog = [[UIAlertView alloc] initWithTitle:@"Multi Button Alert" message:@"This is an alert with multiple buttons" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Do this", @"Do that", nil];
	[alertDialog show];
}

- (IBAction)doAlertInput:(id)sender {
	UIAlertView *alertDialog;
	
	alertDialog = [[UIAlertView alloc] initWithTitle:@"Alert with inputs" message:@"Please type your email and password"  delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
	
	alertDialog.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
	
	[alertDialog show];
}

- (IBAction)doActionSheet:(id)sender {
	UIActionSheet *actionSheet;
	actionSheet = [[UIActionSheet alloc] initWithTitle:@"Options" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"Edit", @"Move", nil];

	actionSheet.actionSheetStyle=UIActionSheetStyleDefault;
	
	[actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
}

- (IBAction)doSound:(id)sender {
	SystemSoundID soundID;
	NSString *soundfile = [[NSBundle mainBundle] pathForResource:@"soundeffect" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:soundfile], &soundID);
	AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender {
	SystemSoundID soundID;
	NSString *soundfile = [[NSBundle mainBundle] pathForResource:@"alertsound" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:soundfile], &soundID);
	AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
