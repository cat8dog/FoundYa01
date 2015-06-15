#import <UIKit/UIKit.h>
#import "loginViewController.h"

@interface ProfileTableViewController : UIViewController <NSURLConnectionDelegate,UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

// UITableView header view properties
//@property (nonatomic, strong) IBOutlet UIView *headerView;
//@property (nonatomic, strong) IBOutlet UILabel *headerNameLabel;
//@property (nonatomic, strong) IBOutlet UIImageView *headerImageView;
@property (nonatomic, assign) BOOL didAriveFromFirstTimeSignUp;

// UITableView row data properties
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) UITextField *locationField;
@property (nonatomic, strong) UITextField *genderField;
@property (nonatomic, strong) UITextField *birthdayField;
@property (nonatomic, strong) UITextField *bioField;
@property (strong, nonatomic) UIButton *saveButton;

@property (nonatomic, strong) UITableView *tableView;

@end
