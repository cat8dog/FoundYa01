#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignUpViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *entryDone;
-(void) processFieldEntries;
//-(void) pushToMap;
-(void) pushToProfile;
@end
