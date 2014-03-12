//
//  AddPostcard.m
//  cityLandscapes
//
//  Created by Dan Mindru on 12/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "AddPostcard.h"

#define IMAGE_WIDTH IMAGE_HEIGHT*320/568
#define IMAGE_HEIGHT 210
#define IMAGE_OFFSET 10
#define IMAGE_TOP 0

@interface AddPostcard ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContainer;
@property (weak, nonatomic) IBOutlet UIScrollView *imageDisplaySlider;
@property (strong, nonatomic) NSDictionary *loadedImageData;
@property (weak, nonatomic) NSString *selectedImage;

@end

@implementation AddPostcard{
	NSArray *storedPhotoValues;
}

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
	
	//observe keyboard popup
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma will appear actions - load images and display them

- (void)viewWillAppear:(BOOL)animated{
	//change the inset of the main scroll view
	[self.scrollViewContainer setContentInset:UIEdgeInsetsMake(-50, 0, 0, 0)];
	[self.scrollViewContainer setUserInteractionEnabled:YES];
	//set main scroll to hide keyboard on drag
	[self.scrollViewContainer setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
	
	//set the size of the scrollview
	[self.imageDisplaySlider setScrollEnabled:YES];
	[self.imageDisplaySlider setAlwaysBounceHorizontal:YES];
	[self.imageDisplaySlider setUserInteractionEnabled:YES];
	
	NSURL *imagedataURL = [[NSBundle mainBundle] URLForResource:@"imagedata" withExtension:@"plist"];
	
	self.loadedImageData = [[NSDictionary alloc] initWithContentsOfURL:imagedataURL];
	storedPhotoValues = self.loadedImageData.allValues;
	
	int xPosition = 0;
	int numberOfImages = 0;
	for(NSDictionary *oneImageData in storedPhotoValues){
		NSString *imageFilename = [oneImageData valueForKey:@"filename"];
		//NSString *imageTitle = [oneImageData valueForKey:@"title"];
		
		//create image
		UIImage *imageInstance = [UIImage imageNamed:imageFilename];

		
//		maybe this can be done with an image view, but not recommended:
		
//		UIImageView *oneImageView = [[UIImageView alloc] initWithImage:imageInstance];
//		oneImageView.frame = CGRectMake(xPosition, -IMAGE_TOP, IMAGE_WIDTH, IMAGE_HEIGHT );
//		[oneImageView setBounds:CGRectMake(xPosition, -IMAGE_TOP, IMAGE_WIDTH, IMAGE_HEIGHT )];
		
		
		//adding images as buttons
		UIButton *imageButton = [[UIButton alloc] initWithFrame:CGRectMake(xPosition, -IMAGE_TOP, IMAGE_WIDTH, IMAGE_HEIGHT )];
		[imageButton setBackgroundImage:imageInstance forState:UIControlStateNormal];
		[imageButton addTarget:self action:@selector(selectedImageFromList:) forControlEvents:UIControlEventTouchUpInside];
		[imageButton setTitle:imageFilename forState:UIControlStateNormal];
		[imageButton setUserInteractionEnabled:YES];
		
		xPosition += IMAGE_WIDTH + IMAGE_OFFSET;
		numberOfImages ++;
		
		//append to scrollview
		[self.imageDisplaySlider addSubview:imageButton];
	}
	
	[self.imageDisplaySlider setContentSize:CGSizeMake((IMAGE_WIDTH+IMAGE_OFFSET)*numberOfImages, 0)];
}

#pragma image touch actions
- (IBAction)selectedImageFromList:(id)sender{
	NSArray *allSubviews = [self.imageDisplaySlider subviews];
	[self defaultUnselectedImages:allSubviews];
	
	self.selectedImage = [sender currentTitle];
	[sender setImage:[UIImage imageNamed:@"checkmark"] forState:UIControlStateNormal];
	[sender setImageEdgeInsets:UIEdgeInsetsMake(0, 23, 0, 0)];
	[[sender titleLabel] removeFromSuperview];
	[sender setAlpha:0.8];
}

- (void)defaultUnselectedImages:(NSArray *)subviews{
	
	for (id oneImage in subviews) {
		
		if([oneImage isKindOfClass:[UIButton class]]){
			[oneImage setAlpha:1];
			[oneImage setImage:nil forState:UIControlStateNormal];
			[oneImage addSubview:[oneImage titleLabel]];
		}
	}
}

#pragma keyboard actions (dismiss and move keyboard)

//dismiss on return
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
	//scroll to the bottom of the view
	CGPoint bottomOffset = CGPointMake(0, self.scrollViewContainer.contentSize.height - self.scrollViewContainer.bounds.size.height);
	[self.scrollViewContainer setContentOffset:bottomOffset animated:YES];
}

- (void)keyboardDidShow{
	
}

#pragma segue actions

- (IBAction)cancelAdd:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end


