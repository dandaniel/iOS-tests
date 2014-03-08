//
//  ViewController.h
//  customPicker
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

- (void)displayAnimal: (NSString*)chosenAnimal withSound: (NSString*)chosenSound fromComponent:(NSString *)chosenComponent;
@end
