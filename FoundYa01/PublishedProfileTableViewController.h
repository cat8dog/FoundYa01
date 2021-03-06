
#import <UIKit/UIKit.h>

@class PublishedProfileTableViewController;
@protocol PublishedProfileTableViewControllerDelegate <NSObject>

@end

@interface PublishedProfileTableViewController : UIViewController <NSURLConnectionDelegate,UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, assign) BOOL didAriveFromFirstTimeSignUp;


// UITableView row data properties
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) UITextField *locationField;
@property (nonatomic, strong) UITextField *genderField;
@property (nonatomic, strong) UITextField *birthdayField;
@property (nonatomic, strong) UITextField *bioField;
@property (nonatomic, strong) UITextField *ethnicityField;
@property (nonatomic, strong) UITextField *hairColourField;
@property (strong, nonatomic) UIButton *saveButton;

@property (nonatomic, strong) UITableView *tableView;

@end
