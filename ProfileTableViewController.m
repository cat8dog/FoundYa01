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
    cell.textLabel.text = self.rowTitleArray[indexPath.row];
    cell.detailTextLabel.text = self.rowDataArray[indexPath.row];
    
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
        self.headerNameLabel.text = name;
    }
    
    // set the photo
    NSString *userProfilePhotoURLString = [PFUser currentUser][@"pictureURL"];
    if (userProfilePhotoURLString) {
//        self.headerImageView.image = [UIImage imageWithData:data];
        
        // Add a nice corner radius to the image
        self.headerImageView.layer.cornerRadius = 8.0f;
        self.headerImageView.layer.masksToBounds = YES;
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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[ProfileHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
}

- (void) newSignupUser {
    if (self) {
        self.didAriveFromFirstTimeSignUp = YES;
        [self buildTableView];
    }

}



@end
