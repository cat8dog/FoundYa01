//
//  DateTimeViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-23.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DateTimeViewController;
@class PFQuery;

@protocol DateTimeViewControllerDelegate <NSObject>
    - (void)didSaveDateTime:(NSDate *)queryDateString onViewController:(DateTimeViewController *)DateTimeVC;
@end



@interface DateTimeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *setDateTime;
@property (weak, nonatomic) IBOutlet UILabel *selectedDate;
@property (weak, nonatomic) NSDate *datePickerControl;
@property (weak, nonatomic) NSDate *strDate;

@property (weak, nonatomic) id <DateTimeViewControllerDelegate> delegate;

- (void)datePickerChanged:(UIDatePicker *)datePicker;


- (IBAction)Done:(id)sender;

@end
