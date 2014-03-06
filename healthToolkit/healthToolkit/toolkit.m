//
//  toolkit.m
//  healthToolkit
//
//  Created by dmu mac 18 on 06/02/14.
//  Copyright (c) 2014 Dan M. All rights reserved.
//

#import "toolkit.h"

@implementation toolkit

+(float) calculateBMI: (float)weight andHeight:(float)height{
    return weight/(height*height);
}

+(float) convertKjToKcal: (int)Kj{
    return Kj / 4.184;
}

+(float) convertTrainingTokCal: (int)minutes andType:(int)activityType{
    switch (activityType){
        case 1:
            return minutes*4;
        break;
        case 2:
            return minutes*7;
        break;
        case 3:
            return minutes*10;
        break;
        default:
            return minutes*4;
        break;
    }
}

@end
