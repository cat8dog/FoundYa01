//#import "PublishedProfileTableViewController.h"
//#import "ProfileTableViewController.h"
//#import <Parse/Parse.h>
//#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
//#import "ProfileHeaderView.h"
//#import "TextFieldTableViewCell.h"
//#import "UIViewController+Alert.h"
//
//typedef NS_ENUM(NSUInteger, ProfileSection) {
//    ProfileSectionPhoto = 0,
//    ProfileSectionName,
//    ProfileSectionLocation,
//    ProfileSectionGender,
//    ProfileSectionBirthday,
//    ProfileSectionBio
//};
//
//@interface PublishedProfileTableViewController ()
//
//@end
//
//@implementation PublishedProfileTableViewController
//{
//    UIImage *_profileImage;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
// // [self buildTableView];
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return 6;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    // Return the number of rows in the section.
//    return section == 0 ? 0 : 1;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[identifier];
//                                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//                                    
//    cell.textField.delegate = self;
//                                    
//    switch (indexPath.section)
//        {
//        case ProfileSectionName:
//            cell.textField.text = [PFUser currentUser].username;
//            cell.textField.placeholder = @"Name";
//            break;
//            
//        case ProfileSectionLocation:
//            cell.textField.text = [PFUser currentUser][@"location"];
//            cell.textField.placeholder = @"Location";
//            break;
//            
//        case ProfileSectionGender:
//            cell.textField.text = [PFUser currentUser][@"gender"];
//            cell.textField.placeholder = @"Gender";
//            break;
//            
//        case ProfileSectionBirthday:
//            cell.textField.text = [PFUser currentUser][@"birthday"];
//            cell.textField.placeholder = @"Birthday";
//            break;
//            
//        case ProfileSectionBio:
//            cell.textField.text = [PFUser currentUser][@"bio"];
//            cell.textField.placeholder = @"Bio";
//            break;
//            
//        default:
//            break;
//    }
//
//    return cell;
//}
//
///*
//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//*/
//
///*
//// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
//}
//*/
//
///*
//// Override to support rearranging the table view.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
//}
//*/
//
///*
//// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//}
//*/
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
