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
    PFQuery *query = [Pin query];
    NSDate *date = self.setDateTime.date;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [calendar components:(NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitDay) fromDate:date];
    component.minute = 59;
    component.hour = 23;
    NSDate *midnight = [calendar dateFromComponents:component];
    component.minute = 0;
    component.hour = 0;
    NSDate *morning = [calendar dateFromComponents:component];
    [query whereKey:@"pinDropDate" greaterThan:morning];
    [query whereKey:@"pinDropDate" lessThan:midnight];
    [self.delegate didSaveDateTime:query onViewController:self];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
