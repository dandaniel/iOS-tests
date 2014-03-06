//
//  ViewController.m
//  randomizr
//
//  Created by DMU MAC 07 on 20/02/14.
//  Copyright (c) 2014 DMU MAC 07. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UITextField *nameTxt;

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

- (IBAction)changeName:(id)sender {
    self.nameLbl.text = self.nameTxt.text;
}

@end
