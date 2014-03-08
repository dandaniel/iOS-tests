//
//  customPickerView.m
//  customPicker
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "customPickerView.h"
#import "ViewController.h"
#define COMPONENT_COUNT 2
#define ANIMAL_COMPONENT 0
#define SOUND_COMPONENT 1

@interface customPickerView ()
@property (weak, nonatomic) IBOutlet UIPickerView *customDatePicker;
@property (strong, nonatomic) NSArray* animalNames;
@property (strong, nonatomic) NSArray* animalPictures;
@property (strong, nonatomic) NSArray* animalSounds;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property int chosenAnimal;
@property int chosenSound;

@end

@implementation customPickerView

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
	
	//default picker values
	self.chosenAnimal = 0;
	self.chosenSound = 0;
	
	self.animalNames = @[@"Mouse",@"Goose",@"Cat",@"Dog",@"Snake",@"Bear",@"Pig"];
	
	self.animalPictures = @[
		[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse.png"]],
		[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goose.ong"]],
		[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat.png"]],
		[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog.png"]],
		[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snake.png"]],
		[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear.png"]],
		[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pig.png"]]
		];
	 
	self.animalSounds = @[@"Oink", @"Rawr", @"Ssss", @"Roof", @"Meow", @"Honk", @"Squeak"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissAnimalChooser:(id)sender {
	ViewController *mainView;
	mainView = (ViewController *)self.delegate;
	
	[mainView displayAnimal:self.animalNames[self.chosenAnimal] withSound:self.animalSounds[self.chosenSound] fromComponent:@"the Sound"];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return COMPONENT_COUNT;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	if(component == ANIMAL_COMPONENT){
		return self.animalNames.count;
	}
	else{
		return self.animalSounds.count;
	}
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
	
	if(component == ANIMAL_COMPONENT){
		UIImageView *chosenImage = self.animalPictures[row];
		//workaournd for ios 7
		UIImageView *workAroundView = [[UIImageView alloc]initWithFrame:chosenImage.frame];
		workAroundView.backgroundColor = [UIColor colorWithPatternImage:chosenImage.image];
		return workAroundView;
	}
	else{
		UILabel *chosenSound = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,32)];
		chosenSound.backgroundColor = [UIColor clearColor];
		chosenSound.text = self.animalSounds[row];
		return chosenSound;
	}
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
	return 55.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
	if(component == ANIMAL_COMPONENT){
		return 75.0;
	}
	else{
		return 150;
	}
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	self.chosenAnimal = [self.customDatePicker selectedRowInComponent:ANIMAL_COMPONENT];
	self.chosenSound = [self.customDatePicker selectedRowInComponent:SOUND_COMPONENT];
}




@end
