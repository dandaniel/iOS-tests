//
//  ViewController.h
//  editingWithSegue
//
//  Created by Dan Mindru on 07/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

-(IBAction)returnToMain:(UIStoryboardSegue *)segue;

@end
