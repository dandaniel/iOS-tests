//
//  alertTouches.h
//  gettingAttention
//
//  Created by Dan Mindru on 05/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewControllerDelegate
-(void)updateLabelText:(NSString *)newText;

@end

//@interface alertTouches : UIViewController <UIAlertViewDelegate>
@interface alertTouches : UIViewController
@property (weak, nonatomic) id <ViewControllerDelegate> viewControllerDelegate;

@end
