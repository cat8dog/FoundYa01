#import "DateTimeViewController.h"
#import "Pin.h"

@interface DateTimeViewController ()


@end

@implementation DateTimeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.setDateTime addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    // Do any additional setup after loading the view.
}
    
- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
       
    self.selectedDate.text = strDate;
}

- (IBAction)Done:(id)sender
{
    
    NSDate *date = self.setDateTime.date;

    [self.delegate didSaveDateTime:date onViewController:self];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
