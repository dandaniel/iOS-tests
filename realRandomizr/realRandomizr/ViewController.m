//
//  ViewController.m
//  realRandomizr
//
//  Created by DMU MAC 07 on 20/02/14.
//  Copyright (c) 2014 DMU MAC 07. All rights reserved.
//

#import "ViewController.h"
#import "randomNumber.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputNumber;
@property (weak, nonatomic) IBOutlet UITextField *inputNumber;
- (IBAction)generateNumber:(id)sender;

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

- (IBAction)generateNumber:(id)sender {
    if(self.inputNumber.text != nil && [self.inputNumber.text intValue]){
        self.outputNumber.text = [NSString stringWithFormat:(@"%i"),
                                  [randomNumber getRandomNumber: [self.inputNumber.text intValue]
                                   ]
            ];
        
        ;
    }
    else{
        self.outputNumber.text = @"Input error";
    }
    
    [self.inputNumber resignFirstResponder];
}
@end
