//
//  NSString+NSString_changeSpacesWithDash.m
//  archiveFileWithStringCategory
//
//  Created by Dan Mindru on 07/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "NSString+NSString_changeSpacesWithDash.h"

@implementation NSString (NSString_changeSpacesWithDash)

- (NSString *) convertSpacesWithDash{
	NSLog(@"Here you go %@", [self stringByReplacingOccurrencesOfString:@"n" withString:@"-"]);
	return [self stringByReplacingOccurrencesOfString:@"n" withString:@"-"];
}

@end
