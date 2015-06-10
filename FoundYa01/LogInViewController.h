#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LogInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UIButton *signUp;

@property (nonatomic, assign) BOOL shouldShowMap;

//- (IBAction)fbLoginButton:(id)sender;

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *fbLoginButton;



@end
