#import <UIKit/UIKit.h>
#import "loginViewController.h"

@interface ProfileTableViewController : UITableViewController <NSURLConnectionDelegate>


// UITableView header view properties
@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet UILabel *headerNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *headerImageView;
@property (nonatomic, assign) BOOL didAriveFromFirstTimeSignUp;

// UITableView row data properties
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
-(void) updateProfileData;

@end
