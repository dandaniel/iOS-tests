//
//  main.m
//  healthToolkit
//
//  Created by dmu mac 18 on 06/02/14.
//  Copyright (c) 2014 Dan M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "toolkit.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        float height;
        float weight;
        int kj;
        
        NSLog(@"Please input height (in meters)");
        scanf("%f", &height);
        NSLog(@"Please input weight (in KG)");
        scanf("%f", &weight);
        
        NSLog(@"The BMI for a person of height 1.80m and weight 90kg is: %f", [toolkit calculateBMI:weight andHeight:height]);
        
        NSLog(@"I know you also want to convert KJ to Kcal, please type how many Kj:");
        scanf("%i", &kj);
        NSLog(@"Here is the value converted to Kcal: %f", [toolkit convertKjToKcal:kj]);
        
        NSLog(@"Also, by doing 10 minutes of typing you will burn %f Kcal", [toolkit convertTrainingTokCal:10 andType:3]);
    }
    return 0;
}

