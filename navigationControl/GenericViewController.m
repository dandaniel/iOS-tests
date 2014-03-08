//
//  GenericViewController.m
//  navigationControl
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "GenericViewController.h"
#import "CountingNavigationController.h"

@interface GenericViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property int counting;

@end

@implementation GenericViewController

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

- (void)viewWillAppear:(BOOL)animated{
	self.countLabel.text = [NSString stringWithFormat:@"%i", ((CountingNavigationController*)self.parentViewController).counting];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementCount:(id)sender {
	((CountingNavigationController*)self.parentViewController).counting++;
}

@end
