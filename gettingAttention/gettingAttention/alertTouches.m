//
//  alertTouches.m
//  gettingAttention
//
//  Created by Dan Mindru on 05/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "alertTouches.h"

@implementation alertTouches

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	NSString * buttonTitle = [alertView	buttonTitleAtIndex:buttonIndex];
	
	if([buttonTitle isEqualToString:@"Do this"]){
		[self.viewControllerDelegate updateLabelText:@"Did this"];
	}
}

@end
