#import "PublishedProfileTableViewController.h"
#import "ProfileTableViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "ProfileHeaderView.h"
#import "TextFieldTableViewCell.h"
#import "UIViewController+Alert.h"

typedef NS_ENUM(NSUInteger, ProfileSection) {
    ProfileSectionPhoto = 0,
    ProfileSectionName,
    ProfileSectionLocation,
    ProfileSectionGender,
    ProfileSectionBirthday,
    ProfileSectionEthnicity,
    ProfileSectionHairColour,
    ProfileSectionBio
};

@interface PublishedProfileTableViewController ()

@end

@implementation PublishedProfileTableViewController
{
    UIImage *_profileImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 8;
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
                
        case ProfileSectionEthnicity:
            cell.textField.text = @"";
            cell.textField.placeholder = @"ethnicity";
            break;
                
        case ProfileSectionHairColour:
            cell.textField.text = @"";
            cell.textField.placeholder = @"hair colour";
            break;
            
        default:
            break;
    }

    return cell;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//
//- (void)tableView:(UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath
//{
//    //[ProfileSection removeObjectAtIndex:indexPath.row];
//
//    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//
//}

@end
