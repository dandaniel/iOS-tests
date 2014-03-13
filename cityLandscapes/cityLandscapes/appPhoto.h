//
//  appPhoto.h
//  cityLandscapes
//
//  Created by Dan Mindru on 11/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appPhoto : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSString *description;

- (id)initWithTitle:(NSString *)title andFilename:(NSString *)filename andDescription:(NSString *)description;
+ (NSString *) getUrl;
- (void) saveToPlist:(NSString *)plistURL;
+ (NSMutableArray *) readFromPlist:(NSString *)plistURL;
+ (void) removeFromPlist:(NSString *)plistURL andObjects:(NSMutableArray *)objectList;

@end
