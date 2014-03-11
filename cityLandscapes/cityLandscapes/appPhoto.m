//
//  appPhoto.m
//  cityLandscapes
//
//  Created by Dan Mindru on 11/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "appPhoto.h"

@implementation appPhoto

- (id)initWithTitle:(NSString *)title andFilename:(NSString *)filename andDescription:(NSString *)description{
	
	self = [super init];
	
	if (self){
		self.title = title;
		self.filename = filename;
		self.description = description;
	}
	
	return self;
}

@end
