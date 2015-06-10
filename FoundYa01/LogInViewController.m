#import "LogInViewController.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@interface LogInViewController ()<FBSDKLoginButtonDelegate>

@end

@implementation LogInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.fbLoginButton.delegate = self;
//    self.fbLoginButton.readPermissions = @[@"birthday",@"bio",@"education",@"work",@"picture"];
}

- (IBAction)userLogin:(id)sender {
    [self processFieldEntries];
//    [NSTimeZone setDefaultTimeZone:[NSTimeZone localTimeZone]];
    
}

- (IBAction)openMapView:(id) sender
{ NSLog(@"BAM!!!");
    UIViewController *MapViewController = (UIViewController *)[[UIStoryboard storyboardWithName:@"Main"
    bundle:nil] instantiateViewControllerWithIdentifier:@"MapViewController"];
    [self.navigationController pushViewController:MapViewController animated:NO];
}


- (IBAction)openProfileView:(id) sender
{ NSLog(@"BAM!!!");
    UITableViewController *ProfileTableViewController = (UITableViewController *)[[UIStoryboard storyboardWithName:@"Main"
    bundle:nil] instantiateViewControllerWithIdentifier:@"ProfileTableViewController"];
    [self.navigationController pushViewController:ProfileTableViewController animated:NO];
}




- (void)processFieldEntries

{ // get username and password info
    
    
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    NSString *noUserNameText = @"username";
    NSString *noPasswordText = @"password";
    NSString *errorText = @"No ";
    NSString *errorTextJoin = @" or ";
    NSString *errorTextEnding = @" entered";
    BOOL textError = NO;
    
    if (password.length == 0)
    {
        [self.passwordField becomeFirstResponder];
    }
    if (username.length == 0)
    {
        [self.usernameField becomeFirstResponder];
    }
    
    if ([username length] == 0)
        
    {
        textError = YES;
        errorText = [errorText stringByAppendingString:noUserNameText];
    }
    
    if ([password length] == 0)
    {
        textError = YES;
        if ([username length] == 0)
        {
            errorText = [errorText stringByAppendingString:errorTextJoin];
        }
        errorText = [errorText stringByAppendingString:noPasswordText];
    }
    
    if (textError) {
        errorText = [errorText stringByAppendingString:errorTextEnding];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:errorText
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
        [alertView show];
        
        return;
    }


// User info checks out, logging in with Parse
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
        if (user)
        {
            [self performSegueWithIdentifier:@"gotoMap" sender:nil];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Try Again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
}


    
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
        if ([PFUser currentUser]) {
            [self openMapView:nil];
        }
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{
    if (error)
    {
        //show a alert
        return;
    }
    [PFFacebookUtils logInInBackgroundWithAccessToken:result.token block:^(PFUser *user, NSError *error){
        if (error)
        {
            //show a alert.
            return;
        }
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me?fields=id,name,gender,birthday,bio,education,work,picture" parameters:nil];
        
        __weak typeof(self) weakSelf = self;
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            NSDictionary *userInfo = result;
            PFUser *currentUser = [PFUser currentUser];
            currentUser[@"name"] = userInfo[@"name"];
            currentUser[@"gender"] = userInfo[@"gender"];
            NSDictionary *photoInfo = userInfo[@"picture"][@"data"];
            currentUser[@"photo_url"] = photoInfo[@"url"];
            [currentUser saveInBackground];
            [weakSelf openProfileView:nil];
        }];
    }];
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
        
}

@end
