#import "LogInViewController.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>


@interface LogInViewController ()

@end

@implementation LogInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        [self openMapView:nil];
 
    
    } else {
        [self processFieldEntries];
    }
}


- (IBAction)userLogin:(id)sender {
    [self processFieldEntries];
//    [NSTimeZone setDefaultTimeZone:[NSTimeZone localTimeZone]];
    
}

- (IBAction)openMapView:(id) sender
{ NSLog(@"BAM!!!");
    UIViewController *MapViewController = (UIViewController *)[[UIStoryboard storyboardWithName:@"Main"
    bundle:nil] instantiateViewControllerWithIdentifier:@"MapViewController"];
    [self.navigationController pushViewController:MapViewController animated:YES];
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


    




@end
