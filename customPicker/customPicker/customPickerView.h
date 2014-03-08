//
//  customPickerView.h
//  customPicker
//
//  Created by Dan Mindru on 08/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customPickerView : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) id delegate;

@end
