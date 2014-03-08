//
//  ViewController.h
//  gettingAttention
//
//  Created by Dan Mindru on 05/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

@import AudioToolbox;
#import <UIKit/UIKit.h>

@interface ViewController :UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>

- (void)updateLabelText:(NSString *)newText;

@end
