//
//  randomNumber.m
//  realRandomizr
//
//  Created by DMU MAC 07 on 20/02/14.
//  Copyright (c) 2014 DMU MAC 07. All rights reserved.
//

#import "randomNumber.h"

@implementation randomNumber
+(int)getRandomNumber: (int)maxNumber{
    return arc4random() % maxNumber;
}
@end
