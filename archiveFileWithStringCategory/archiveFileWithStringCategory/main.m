//
//  main.m
//  archiveFileWithStringCategory
//
//  Created by Dan Mindru on 07/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "NSString+NSString_changeSpacesWithDash.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		NSArray *paths =NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
		NSString *documentsPath = [paths objectAtIndex:0];
		//not really the path that I expected..
		NSLog(@"document path is %@", documentsPath);
	    
		Employee * dan = [[Employee alloc] init];
		[dan setEmployeeId:1];
	    [dan setEmployeeName:@"Dan Mindru"];
		[dan setEmployeeSalary:@15000];
		[dan setEmployeePosition:@"CEO"];
		
		//not really related to archiving, use a category method to output something in the log
		NSString *dashedDan = [[NSString alloc] initWithFormat:@"Another name here"];
		[dashedDan convertSpacesWithDash];
		
		//archive employee named Dan Mindru
		[NSKeyedArchiver archiveRootObject:dan toFile:@"/Users/mindrudan/Work/School iOS projects/archiveFileWithStringCategory/dan.plist"];
		
		Employee * evilDan = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/mindrudan/Work/School iOS projects/archiveFileWithStringCategory/dan.plist"];
		
		NSLog(@"Evil dan's salary is: %@", evilDan.employeeSalary);
		NSLog(@"Evil dan's dashed name is: %@", evilDan.employeeName);
	}
    return 0;
}

