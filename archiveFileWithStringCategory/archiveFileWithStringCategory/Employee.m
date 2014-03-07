//
//  Employee.m
//  archiveFileWithStringCategory
//
//  Created by Dan Mindru on 07/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (void) encodeWithCoder: (NSCoder *) coder{
	NSNumber * empId = [[NSNumber alloc] initWithInt:self.employeeId];
	
	[coder encodeObject:empId forKey:@"employeeId"];
	[coder encodeObject:self.employeeName forKey:@"employeeName"];
	[coder encodeObject:self.employeeSalary forKey:@"employeeSalary"];
	[coder encodeObject:self.employeePosition forKey:@"employeePosition"];
	
}

- (id) initWithCoder: (NSCoder *) coder{
	NSNumber *empId = [coder decodeObjectForKey:@"employeeId"];
	
	self.employeeId = (int) [empId integerValue];
	self.employeeName = [coder decodeObjectForKey:@"employeeName"];
	self.employeeSalary = [coder decodeObjectForKey:@"employeeSalary"];
	self.employeePosition = [coder decodeObjectForKey:@"employeePosition"];
	
	return self;
}

@end
