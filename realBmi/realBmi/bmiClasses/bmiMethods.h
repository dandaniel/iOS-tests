//
//  bmiMethods.h
//  realBmi
//
//  Created by Dan Mindru on 20/02/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bmiMethods : NSObject
@property float height;
@property float weight;
@property int unitType; //1 metric, 2 imperial

+(float)calculateBMI:(float)height andWeight:(float)weight andHeightType:(NSInteger)heightType andWeightType:(NSInteger)weightType;
+(NSString*) determineFitLevel:(float)bmi withGender:(NSString *)gender;
+(float)convertInToCm:(float)inchValue;
+(float)convertLbToKg:(float)lbValue;

@end
