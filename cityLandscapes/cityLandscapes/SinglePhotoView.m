//
//  SinglePhotoView.m
//  cityLandscapes
//
//  Created by Dan Mindru on 11/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "SinglePhotoView.h"

@interface SinglePhotoView ()
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end

@implementation SinglePhotoView

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
	
	UIImage *grabbedImage = [UIImage imageNamed:self.currentPhoto.filename];
	[self.currentImage setImage:grabbedImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma segue actions

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	DetailsView * dv = [segue destinationViewController];
	dv.currentPhoto = self.currentPhoto;
}

@end
