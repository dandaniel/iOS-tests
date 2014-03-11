//
//  DetailsView.m
//  cityLandscapes
//
//  Created by Dan Mindru on 11/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "DetailsView.h"

@interface DetailsView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailsView

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

- (void)viewWillAppear:(BOOL)animated{
	//set the title and details
	self.titleLabel.text = self.currentPhoto.title;
	self.descriptionLabel.text = self.currentPhoto.description;
}

- (IBAction)goBack:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
