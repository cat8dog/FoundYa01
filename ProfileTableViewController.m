#import "ProfileTableViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "SignUpViewController.h"
#import "ProfileHeaderView.h"
#import "TextFieldTableViewCell.h"
#import "UIViewController+Alert.h"

typedef NS_ENUM(NSUInteger, ProfileSection) {
    ProfileSectionPhoto = 0,
    ProfileSectionName,
    ProfileSectionLocation,
    ProfileSectionGender,
    ProfileSectionBirthday,
    ProfileSectionBio
};
@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController 
{
    UIImage *_profileImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Save button: for saving info to Parse then moving user to MapViewController
//    self.saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.saveButton.frame = CGRectMake(0.0, CGRectGetHeight(self.view.bounds) - 50.0f, CGRectGetWidth(self.view.bounds), 50.0f);
//    self.saveButton.backgroundColor = [UIColor blackColor];
//    [self.saveButton setTitle:@"save" forState:UIControlStateNormal];
//    [self.view addSubview:self.saveButton];
//    [self.saveButton addTarget:self action:@selector(saveToParse:) forControlEvents:UIControlEventTouchUpInside];
    
    [self buildTableView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[PFUser currentUser][@"photo_url"]]];
        dispatch_sync(dispatch_get_main_queue(), ^{UIImage *image = [UIImage imageWithData:data];
            _profileImage = image;
            [self.tableView reloadData];
        });
    });
    
    [self.view bringSubviewToFront:self.saveButton];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return section == 0 ? 0 : 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [@(indexPath.section) stringValue];
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    if (cell == nil)
    {
        cell = [[TextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textField.delegate = self;
    
    switch (indexPath.section)
    {
        case ProfileSectionName:
            cell.textField.text = [PFUser currentUser].username;
            cell.textField.placeholder = @"Name";
            break;
            
        case ProfileSectionLocation:
            cell.textField.text = [PFUser currentUser][@"location"];
            cell.textField.placeholder = @"Location";
            break;
            
        case ProfileSectionGender:
            cell.textField.text = [PFUser currentUser][@"gender"];
            cell.textField.placeholder = @"Gender";
            break;
            
        case ProfileSectionBirthday:
            cell.textField.text = [PFUser currentUser][@"birthday"];
            cell.textField.placeholder = @"Birthday";
            break;
            
        case ProfileSectionBio:
            cell.textField.text = [PFUser currentUser][@"bio"];
            cell.textField.placeholder = @"Bio";
            break;
            
        default:
            break;
    }

    return cell;
    

}

// Set received values if they are not nil and reload the table
//- (void)_updateProfileData {
//    NSLog(@"update profile data");
//    
//    
//    NSString *location = [PFUser currentUser][@"location"];
//    if (location) {
//        self.rowDataArray[0] = location;
//    } else {
//        
//        self.rowDataArray[0] = @"Location Unknown";
//    }
//    
//    NSString *gender = [PFUser currentUser][@"gender"];
//    if (gender) {
//        self.rowDataArray[1] = gender;
//    } else {
//        self.rowDataArray[1] = @"Gender Unknown";
//    }
//    
//    NSString *birthday = [PFUser currentUser][@"birthday"];
//    if (birthday) {
//        self.rowDataArray[2] = birthday;
//    } else {
//        self.rowDataArray[2] = @"Birthday Unknown";
//    }
//    
//    NSString *bio = [PFUser currentUser][@"bio"];
//    if (bio) {
//        self.rowDataArray[3] = bio;
//    } else {
//        self.rowDataArray[3] = @"Please tell us about yourself";
//    }
//    
//    NSLog(@"%@",self.rowDataArray);
//    [self.tableView reloadData];
//
//    if ([PFUser currentUser][@"picture"]) {
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[PFUser currentUser][@"picture"]]];
//        [UIImage imageWithData:data];
//    }
//    
//    // set the name in the header view label
//    NSString *name = [PFUser currentUser][@"name"];
//    if (name) {
////        self.headerNameLabel.text = name;
//    }
//    
//    // set the photo
//    NSString *userProfilePhotoURLString = [PFUser currentUser][@"pictureURL"];
//    if (userProfilePhotoURLString) {
//
//        
//    } else {
//        NSLog(@"Failed to load profile photo.");
//    }
//    
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)//profilePicture
    {
        ProfileHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
        headerView.avatarView.image = _profileImage;
        return headerView;
    }else{
        UITableViewHeaderFooterView *view = [tableView dequeueReusableCellWithIdentifier:@"textHeader"];
        if (!view)
        {
            view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"textHeader"];
        }
        switch (section) {
            case ProfileSectionName:
            {
                view.textLabel.text = @"Name";
            }
                break;
            case ProfileSectionLocation:
            {
                view.textLabel.text = @"Location";
            }
                break;
            case ProfileSectionGender:
            {
                view.textLabel.text = @"Gender";
            }
                break;
            case ProfileSectionBirthday:
            {
                view.textLabel.text = @"Birthday";
            }
                break;
            case ProfileSectionBio:
            {
                view.textLabel.text = @"Bio";
            }
            default:
                break;
        }
        return view;
    }
    

    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 350.0f;
            
        default:
            return 50.0f;
    }
    return 350.0f;
}

    
- (void) buildTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[ProfileHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [self.view addSubview:self.tableView];
}

- (void) newSignupUser {
    if (self) {
        self.didAriveFromFirstTimeSignUp = YES;
        [self buildTableView];
    }

}

- (NSString *)textForTextFieldAtSection:(NSInteger)section
{
    TextFieldTableViewCell *cell = (TextFieldTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    return cell.textField.text;
}

-(void)saveToParse:(UIButton *)sender{
    
    
    NSLog(@"%@",[self textForTextFieldAtSection: ProfileSectionName]);
    NSString *location = [self textForTextFieldAtSection:ProfileSectionLocation];
    NSString *gender = [self textForTextFieldAtSection: ProfileSectionGender];
    NSString *birthday = [self textForTextFieldAtSection: ProfileSectionBirthday];
    NSString *bio = [self textForTextFieldAtSection: ProfileSectionBio];
    
    PFUser *user = [PFUser currentUser];
    
    NSLog(@"user %@", user);
    
    if (location)
    {
        user[@"location"] = location;
    }
    
    if (gender)
    {
        user[@"gender"]= gender;
    }
    
    if (birthday)
    {
        user[@"birthday"] = birthday;
    }
    
    if (bio)
    {
        user[@"bio"] = bio;
    }
  
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"errooooorrrr!");
            [self showAlertWithTitle:@"Error" message:error.localizedDescription dismissButtonTitle:@"OK"];
            
            return;
        }
        
        // Success!
        NSLog(@"saved success!");
//        [self saveButtonPressed:self];
        
//        if (self.didAriveFromFirstTimeSignUp)
//        {
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: [storyBoard instantiateViewControllerWithIdentifier:@"MapViewController"]];
            [self presentViewController:nav animated:YES completion:nil];
//        }
//        else{
//            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//        }
    }];
}

@end
