//
//  bmiMethods.m
//  realBmi
//
//  Created by Dan Mindru on 20/02/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "bmiMethods.h"

@implementation bmiMethods

+(float)calculateBMI:(float)height andWeight:(float)weight andHeightType:(NSInteger)heightType andWeightType:(NSInteger)weightType{
	
	if(heightType == 1){
		height = [self convertInToCm:height];
	}
	
	if(weightType == 1){
		weight = [self convertLbToKg:weight];
	}
	
	return (weight*10000)/(pow(height,2));
}

+(NSString*) determineFitLevel:(float)bmi withGender:(NSString *)gender{
	NSString* messageIntro;
	NSString* messageBody;
	if([gender isEqualToString:@"male"]){
		messageIntro = @"For a guy, ";
	}
	else{
		messageIntro = @"For a girl, ";
	}
	
	if(bmi < 18.5){
		messageBody = @"you are underweight, consider eating more.";
	}
	else if(bmi >= 18.5 && bmi <= 24.99){
		messageBody = @"you are just fine, but take it slower on that ice-cream.";
	}
	else if(bmi >= 25 && bmi <= 29.99){
		messageBody = @"you are overweight. You should eat less and get in shape.";
	}
	else{
		messageBody = @"you are obese, consider eating less and consulting a nutritionist.";
	}
	
	//convert to NSString for label
	return [NSString stringWithFormat:@"%@%@", messageIntro, messageBody];
}

+(float)convertInToCm:(float)inchValue{
	return inchValue*2.54;
}
+(float)convertLbToKg:(float)lbValue{
	return lbValue/0.453592;
}

@end
