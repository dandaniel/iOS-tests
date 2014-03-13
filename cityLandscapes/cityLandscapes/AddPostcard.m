//
//  AddPostcard.m
//  cityLandscapes
//
//  Created by Dan Mindru on 12/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "AddPostcard.h"
#import "appPhoto.h"
#import "PhotoTable.h"

#define IMAGE_WIDTH IMAGE_HEIGHT*320/568
#define IMAGE_HEIGHT 210
#define IMAGE_OFFSET 10
#define IMAGE_TOP 0
#define SCROLLVIEW_X -50
#define SCROLLVIEW_Y 0
#define SCROLLVIEW_WIDTH 320

@interface AddPostcard ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContainer;
@property (weak, nonatomic) IBOutlet UIScrollView *imageDisplaySlider;
@property (weak, nonatomic) IBOutlet UITextField *postcardTitle;
@property (weak, nonatomic) IBOutlet UITextField *postcardDescription;
@property (strong, nonatomic) NSDictionary *loadedImageData;
@property (weak, nonatomic) NSString *selectedImage;
@property (nonatomic) CGFloat originalViewHeight;

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
	
	//set original height
	self.originalViewHeight = self.scrollViewContainer.frame.size.height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
	//set selected image to default
	self.selectedImage = @"default";
}

#pragma will appear actions - load images and display them

- (void)viewWillAppear:(BOOL)animated{
	//change the inset of the main scroll view
	[self.scrollViewContainer setContentInset:UIEdgeInsetsMake(SCROLLVIEW_X, SCROLLVIEW_Y, 0, 0)];
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
	
	//restore scrollview
	[self.scrollViewContainer setContentSize:CGSizeMake(SCROLLVIEW_WIDTH, self.originalViewHeight)];
	
	//not scroll to top, scroll to the new bottom
	[self animateScrollViewToBottom];
	
	return YES;
}

- (void)keyboardDidShow:(NSNotification *)notification{
	//increase the size of the height
	[self.scrollViewContainer setContentSize:CGSizeMake(SCROLLVIEW_WIDTH, self.originalViewHeight + [self getKeyboardHeight:notification])];
	
	//scroll to the bottom of the view
	[self animateScrollViewToBottom];
}

- (void)animateScrollViewToBottom{
	CGPoint bottomOffset = CGPointMake(0, self.scrollViewContainer.contentSize.height - self.scrollViewContainer.bounds.size.height);
	[self.scrollViewContainer setContentOffset:bottomOffset animated:YES];
}

- (NSInteger)getKeyboardHeight:(NSNotification *)notification{
	NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    NSInteger keyboardHeight = keyboardFrameBeginRect.size.height;
    return keyboardHeight;
}

#pragma create postcard actions
- (IBAction)createPostcard:(id)sender {
	if([self.selectedImage isEqualToString:@"default"]){
		UIAlertView *alertNoSelectedImage = [[UIAlertView alloc] initWithTitle:@"Please select an image" message:@"You need to select an image in order to create a postcard." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
		[alertNoSelectedImage show];
	}
	else{
		//init URL
		NSString *postcardURL = [appPhoto getUrl];
		
		//create postcard instance
		appPhoto *savedPostcard = [[appPhoto alloc] initWithTitle:self.postcardTitle.text andFilename:self.selectedImage andDescription:self.postcardDescription.text];
		[savedPostcard saveToPlist:postcardURL];
		
		//segue back
		[self dismissViewControllerAnimated:YES completion:nil];
	}
}


#pragma segue actions

- (IBAction)cancelAdd:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end


