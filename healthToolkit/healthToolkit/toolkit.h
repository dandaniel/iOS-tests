//
//  toolkit.h
//  healthToolkit
//
//  Created by dmu mac 18 on 06/02/14.
//  Copyright (c) 2014 Dan M. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface toolkit : NSObject

+(float) calculateBMI: (float)weight andHeight:(float)height;
+(float) convertKjToKcal: (int)Kj;
+(float) convertTrainingTokCal: (int)minutes andType:(int)activityType;

@end
