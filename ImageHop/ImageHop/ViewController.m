//
//  ViewController.m
//  ImageHop
//
//  Created by Dan Mindru on 04/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView1;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView2;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView3;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView4;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyView5;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UIStepper *speedStepper;
@property (weak, nonatomic) IBOutlet UILabel *hopsPerSecond;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self initAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleButtonTouch:(id)sender {
	if(self.bunnyView1.isAnimating){
		[self stopAnimating];
		[self.toggleButton setTitle:@"start" forState:UIControlStateNormal];
	}
	else{
		[self.toggleButton setTitle:@"stop" forState:UIControlStateNormal];
		[self startAnimating];
	}
}

- (IBAction)setSpeed:(id)sender {
	NSString *hopRateString;
	
	self.bunnyView1.animationDuration = 2-self.speedSlider.value;
	self.bunnyView2.animationDuration = self.bunnyView1.animationDuration+((float)(rand()%11+1)/10);
	self.bunnyView3.animationDuration = self.bunnyView1.animationDuration+((float)(rand()%11+1)/10);
	self.bunnyView4.animationDuration = self.bunnyView1.animationDuration+((float)(rand()%11+1)/10);
	self.bunnyView5.animationDuration = self.bunnyView1.animationDuration+((float)(rand()%11+1)/10);
	
	[self startAnimating];
	[self.toggleButton setTitle:@"stop" forState:UIControlStateNormal];
	
	hopRateString=[NSString stringWithFormat:@"%1.2f hps", 1/(2-self.speedSlider.value)];
	self.hopsPerSecond.text = hopRateString;
	
}

- (IBAction)stepChange:(id)sender {
	self.speedSlider.value = self.speedStepper.value;
	[self setSpeed:nil];
}

- (void)initAnimation{
	NSArray * hopAnimation = @[
							   [UIImage imageNamed:@"frame-1.png"],
							   [UIImage imageNamed:@"frame-2.png"],
							   [UIImage imageNamed:@"frame-3.png"],
							   [UIImage imageNamed:@"frame-4.png"],
							   [UIImage imageNamed:@"frame-5.png"],
							   [UIImage imageNamed:@"frame-6.png"],
							   [UIImage imageNamed:@"frame-7.png"],
							   [UIImage imageNamed:@"frame-8.png"],
							   [UIImage imageNamed:@"frame-9.png"],
							   [UIImage imageNamed:@"frame-10.png"],
							   [UIImage imageNamed:@"frame-11.png"],
							   [UIImage imageNamed:@"frame-12.png"],
							   [UIImage imageNamed:@"frame-13.png"],
							   [UIImage imageNamed:@"frame-14.png"],
							   [UIImage imageNamed:@"frame-15.png"],
							   [UIImage imageNamed:@"frame-16.png"],
							   [UIImage imageNamed:@"frame-17.png"],
							   [UIImage imageNamed:@"frame-18.png"],
							   [UIImage imageNamed:@"frame-19.png"],
							   [UIImage imageNamed:@"frame-20.png"]];
	self.bunnyView1.animationImages = hopAnimation;
	self.bunnyView2.animationImages = hopAnimation;
	self.bunnyView3.animationImages = hopAnimation;
	self.bunnyView4.animationImages = hopAnimation;
	self.bunnyView5.animationImages = hopAnimation;
	
	self.bunnyView1.animationDuration = 1;
	self.bunnyView2.animationDuration = 1;
	self.bunnyView3.animationDuration = 1;
	self.bunnyView4.animationDuration = 1;
	self.bunnyView5.animationDuration = 1;
}

- (void)stopAnimating{
	[self.bunnyView1 stopAnimating];
	[self.bunnyView2 stopAnimating];
	[self.bunnyView3 stopAnimating];
	[self.bunnyView4 stopAnimating];
	[self.bunnyView5 stopAnimating];
}

- (void)startAnimating{
	[self.bunnyView1 startAnimating];
	[self.bunnyView2 startAnimating];
	[self.bunnyView3 startAnimating];
	[self.bunnyView4 startAnimating];
	[self.bunnyView5 startAnimating];
}

@end