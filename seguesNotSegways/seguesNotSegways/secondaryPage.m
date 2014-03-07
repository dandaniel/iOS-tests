//
//  secondaryPage.m
//  seguesNotSegways
//
//  Created by Dan Mindru on 06/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "secondaryPage.h"

@interface secondaryPage ()

@end

@implementation secondaryPage

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
