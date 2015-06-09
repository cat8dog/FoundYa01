#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


-(void)pushToMap {
    NSLog(@"push to map");
    [self performSegueWithIdentifier:@"gotoMap" sender:self];
    
}

- (IBAction)popMyself:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)imDone:(id)sender {
    NSLog(@"buttton clicked");
    [self processFieldEntries];
}

- (void) processFieldEntries {
    NSLog(@"processfieeeeelds");
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    NSString *passwordAgain = self.passwordAgainField.text;
    NSString *errorText = @"Please";
    NSString *usernameBlankText = @"enter a username";
    NSString *passwordBlankText = @"enter a password";
    NSString *joinText = @", and ";
    NSString *passwordMismatchText = @"enter the same password twice";
    
    BOOL textError = NO;
    // Messaging nil will return 0, so these checks implicitly check for nil text.
    if (username.length == 0 || password.length == 0 || passwordAgain.length == 0) {
        textError = YES;
        
        // Set up the keyboard for the first field missing input:
        if (passwordAgain.length == 0){
            [self.passwordAgainField becomeFirstResponder];
            
            
            if (username.length == 0) {
                errorText = [errorText stringByAppendingString:usernameBlankText];
            }
            if (password.length == 0 || passwordAgain.length == 0){
                if (username.length == 0) { // We need some joining text in the error:
                    errorText = [errorText stringByAppendingString:joinText];
                }
                errorText = [errorText stringByAppendingString:passwordBlankText];
            }
        }
        
    } else if ([password compare:passwordAgain] != NSOrderedSame) {
            // We have non-zero strings.
            // Check for equal password strings.
            textError = YES;
            errorText = [errorText stringByAppendingString:passwordMismatchText];
            [self.passwordField becomeFirstResponder];
    }
    
    if( textError == YES){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:errorText message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        
        return;
    }else{
    
        // Looking good, try logging in.
        
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
             if (error){
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[error userInfo][@"error"] message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                 
                 [alertView show];
                 // Bring the keyboard back up so user can edit.
                 [self.usernameField becomeFirstResponder];
                 return;
             } else {
                 // Handle the success path
                 [self pushToMap];
             }
         }];
    }

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
