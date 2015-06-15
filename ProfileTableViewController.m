#import "ProfileTableViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "SignUpViewController.h"
#import "ProfileHeaderView.h"

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController 
{
    UIImage *_profileImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.saveButton.frame = CGRectMake(0.0, CGRectGetHeight(self.view.bounds) - 50.0f, CGRectGetWidth(self.view.bounds), 50.0f);
    
    self.saveButton.backgroundColor = [UIColor blackColor];
    [self.saveButton setTitle:@"save" forState:UIControlStateNormal];
    [self.view addSubview:self.saveButton];
    [self.saveButton addTarget:self action:@selector(saveToParse:) forControlEvents:UIControlEventTouchUpInside];
    
    self.rowTitleArray = [[NSMutableArray alloc]initWithArray:@[@"Location",@"Gender",@"Birthday",@"Bio"]];
    self.rowDataArray = [[NSMutableArray alloc]initWithArray:@[@"",@"",@"",@""]];
    
    
    [self _updateProfileData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
  // create a method for building tableview for both login styles:
    [self buildTableView];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[PFUser currentUser][@"photo_url"]]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:data];
            _profileImage = image;
            [self.tableView reloadData];
        });
    });
    
    [self.view bringSubviewToFront:self.saveButton];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.rowTitleArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
        // can't select these cells
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
     // Display the data in the table
//    ****OLD CODE
//    cell.textLabel.text = self.rowTitleArray[indexPath.row];
//    cell.detailTextLabel.text = self.rowDataArray[indexPath.row];
//    
//    return cell;
    
//    *****NEW CODE
    
    if (self.didAriveFromFirstTimeSignUp == YES) {
        
    
        if (indexPath.row == 0){
            //self.locationField = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, 280, 21)];
            self.locationField = [[UITextField alloc] initWithFrame:CGRectMake(120, 13, 375, 30)];
            self.locationField.placeholder = self.rowDataArray[indexPath.row];
            self.locationField.autocorrectionType = UITextAutocorrectionTypeNo;
            [self.locationField setClearButtonMode:UITextFieldViewModeWhileEditing];
            //cell.accessoryView = self.locationField;
            [cell addSubview:self.locationField];
        }
        
        if (indexPath.row == 1){
            self.genderField = [[UITextField alloc] initWithFrame:CGRectMake(120, 13, 375, 30)];
            self.genderField.placeholder = self.rowDataArray[indexPath.row];
            self.genderField.autocorrectionType = UITextAutocorrectionTypeNo;
            [self.genderField setClearButtonMode:UITextFieldViewModeWhileEditing];
            //cell.accessoryView = self.genderField;
            [cell addSubview:self.genderField];
        }
        
        if (indexPath.row == 2){
            self.birthdayField = [[UITextField alloc] initWithFrame:CGRectMake(120, 13, 375, 30)];
            self.birthdayField.placeholder = self.rowDataArray[indexPath.row];
            self.birthdayField.autocorrectionType = UITextAutocorrectionTypeNo;
            [self.birthdayField setClearButtonMode:UITextFieldViewModeWhileEditing];
            //cell.accessoryView = self.birthdayField;
            [cell addSubview:self.birthdayField];
        }
        
        if (indexPath.row == 3){
            self.bioField = [[UITextField alloc] initWithFrame:CGRectMake(120, 13, 375, 30)];
            self.bioField.placeholder = self.rowDataArray[indexPath.row];
            self.bioField.autocorrectionType = UITextAutocorrectionTypeNo;
            [self.bioField setClearButtonMode:UITextFieldViewModeWhileEditing];
            //cell.accessoryView = self.bioField;
            [cell addSubview:self.bioField];
        }
        
        self.locationField.delegate = self;
        self.genderField.delegate = self;
        self.birthdayField.delegate = self;
        self.bioField.delegate = self;
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        cell.textLabel.text = self.rowTitleArray[indexPath.row];
        cell.detailTextLabel.text = self.rowDataArray[indexPath.row];
    }
    return cell;

}



// Set received values if they are not nil and reload the table
- (void)_updateProfileData {
    NSLog(@"update profile data");
    
    
    NSString *location = [PFUser currentUser][@"location"];
    if (location) {
        self.rowDataArray[0] = location;
    } else {
        
        self.rowDataArray[0] = @"Location Unknown";
    }
    
    NSString *gender = [PFUser currentUser][@"gender"];
    if (gender) {
        self.rowDataArray[1] = gender;
    } else {
        self.rowDataArray[1] = @"Gender Unknown";
    }
    
    NSString *birthday = [PFUser currentUser][@"birthday"];
    if (birthday) {
        self.rowDataArray[2] = birthday;
    } else {
        self.rowDataArray[2] = @"Birthday Unknown";
    }
    
    NSString *bio = [PFUser currentUser][@"bio"];
    if (bio) {
        self.rowDataArray[3] = bio;
    } else {
        self.rowDataArray[3] = @"Please tell us about yourself";
    }
    
    NSLog(@"%@",self.rowDataArray);
    [self.tableView reloadData];

    if ([PFUser currentUser][@"picture"]) {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[PFUser currentUser][@"picture"]]];
        [UIImage imageWithData:data];
    }
    
    // set the name in the header view label
    NSString *name = [PFUser currentUser][@"name"];
    if (name) {
//        self.headerNameLabel.text = name;
    }
    
    // set the photo
    NSString *userProfilePhotoURLString = [PFUser currentUser][@"pictureURL"];
    if (userProfilePhotoURLString) {
//        self.headerImageView.image = [UIImage imageWithData:data];
        
        // Add a nice corner radius to the image
//        self.headerImageView.layer.cornerRadius = 8.0f;
//        self.headerImageView.layer.masksToBounds = YES;
    } else {
        NSLog(@"Failed to load profile photo.");
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ProfileHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
//    headerView.contentView.backgroundColor = [UIColor
    headerView.avatarView.image = _profileImage;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
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

-(void)saveToParse:(UIButton *)sender{
    
    NSString *location = self.locationField.text;
    NSString *gender = self.genderField.text;
    NSString *birthday = self.birthdayField.text;
    NSString *bio = self.bioField.text;
    
    PFUser *user = [PFUser user];
    user[@"location"] = location;
    user[@"gender"]= gender;
    user[@"birthday"] = birthday;
    user[@"bio"] = bio;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[error userInfo][@"error"]
                                                                message:nil
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"OK", nil];
            [alertView show];
            
            // Bring the keyboard back up, because they'll probably need to change something.
            //[self.usernameField becomeFirstResponder];
            return;
        }
        
        // Success!
        
        [self performSegueWithIdentifier:@"getOptions" sender:self];
    }];
}

@end
