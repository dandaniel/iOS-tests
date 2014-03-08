//
//  ViewController.m
//  customPicker
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"
#import "customPickerView.h"

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

- (IBAction)showAnimalChooser:(id)sender {
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	((customPickerView *)segue.destinationViewController).delegate = self;
}

- (void)displayAnimal: (NSString*)chosenAnimal withSound: (NSString*)chosenSound fromComponent:(NSString *)chosenComponent{
	NSString* animalSoundString = [[NSString alloc] initWithFormat:@"You changed %@ (the image %@ and the sound %@)", chosenComponent, chosenAnimal, chosenSound];
	
	self.outputLabel.text = animalSoundString;
}

@end
