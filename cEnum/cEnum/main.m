//
//  main.m
//  cEnum
//
//  Created by Dan Mindru on 07/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CONSTANT_FAT 25

typedef enum {thin = 10, average = 20, fat = 30, obese = 40} fatIndex;

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    fatIndex thinIndex = thin;
		fatIndex obeseIndex = obese;
#if DEBUG
	    NSLog(@"The thing index corresponds to the number %i", thinIndex);
		NSLog(@"The obese index corresponds to the number %i", obeseIndex);
		NSLog(@"Constant fat is %i", CONSTANT_FAT);
#endif
	}
    return 0;
}

