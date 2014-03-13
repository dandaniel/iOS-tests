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

- (void) encodeWithCoder: (NSCoder *) coder{
	[coder encodeObject:self.title forKey:@"title"];
	[coder encodeObject:self.filename forKey:@"filename"];
	[coder encodeObject:self.description forKey:@"description"];
	
}

- (id) initWithCoder: (NSCoder *) coder{
	self.title = [coder decodeObjectForKey:@"title"];
	self.filename = [coder decodeObjectForKey:@"filename"];
	self.description = [coder decodeObjectForKey:@"description"];
	
	return self;
}

+ (NSString *) getUrl{
	NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsPath = [paths objectAtIndex:0];
	NSString *projectURL = [documentsPath stringByAppendingPathComponent:@"postcard-data.plist"];
	
	return projectURL;
}

#pragma read/write plist

- (void) saveToPlist:(NSString *)plistURL{
	//create a NSMutableDictionary to hold the items
	NSMutableDictionary *itemsHolder = [[NSMutableDictionary alloc] init];
	
	//first load the file contents
	//check if file exists
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:plistURL];
	
	if(fileExists){
		//write the current info in the dictionary
		itemsHolder = [NSKeyedUnarchiver unarchiveObjectWithFile:plistURL];
	}
	
	//add to dictionary
	//adding self as in the current instance of the appPhoto
	[itemsHolder setObject:self forKey:[NSString stringWithFormat:@"%@%f", [NSDate date], random()*100.f]];
	
	//save to file
	[NSKeyedArchiver archiveRootObject:itemsHolder toFile:plistURL];
	
}

//read file
+ (NSMutableArray *) readFromPlist:(NSString *)plistURL{
	NSMutableArray *loadedPostcards = [[NSMutableArray alloc] init];
	
	//check if file exists first
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:plistURL];
	
	if(fileExists){
		
		NSMutableDictionary *allPostcards = [[NSMutableDictionary alloc] init];
		//read values
		allPostcards = [NSKeyedUnarchiver unarchiveObjectWithFile:plistURL];
		
		//if not empty
		if(allPostcards != nil){
			//load the values of all postcards
			NSArray * loadedValues = allPostcards.allValues;
			
			//save to the array that will be returned
			for (appPhoto *onePostcard in loadedValues) {
				[loadedPostcards addObject:onePostcard];
			}
		}
	}
	
	return loadedPostcards;
}

//remove from plist
+ (void) removeFromPlist:(NSString *)plistURL andObjects:(NSMutableArray *)objectList{
	NSMutableDictionary *itemsHolder = [[NSMutableDictionary alloc] init];
	
	//check if the file exists
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:plistURL];
	
	if(fileExists && objectList != nil){
		for (appPhoto *onePostcard in objectList) {
			[itemsHolder setObject:onePostcard forKey:[NSString stringWithFormat:@"%@%f", [NSDate date], random()*100.f]];
		}
	}
	
	//save to file
	[NSKeyedArchiver archiveRootObject:itemsHolder toFile:plistURL];
}


@end
