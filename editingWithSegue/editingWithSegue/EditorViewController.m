//
//  EditorViewController.m
//  editingWithSegue
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "EditorViewController.h"
#import "ViewController.h"

@interface EditorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@end

@implementation EditorViewController

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
	self.emailField.text = ((ViewController *)self.presentingViewController).emailLabel.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateEmail:(id)sender {
	((ViewController *)self.presentingViewController).emailLabel.text = self.emailField.text;
}

- (IBAction)hideKeyboard:(id)sender {
	[self.emailField resignFirstResponder];
}

@end
