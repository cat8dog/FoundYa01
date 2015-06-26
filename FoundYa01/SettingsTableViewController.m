#import "SettingsTableViewController.h"
#import "SettingsTableViewCell.h"

typedef NS_ENUM(NSUInteger, ProfileSection) {

    ProfileSectionSearchMe = 0,
    ProfileSectionSearchTime,
    ProfileSectionSearchLocation,
    ProfileSectionSearchNew,
    ProfileSectionSettings

};

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return 2;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    // Return the number of rows in the section.
//    return 5;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    static NSString *CellIdentifier = @"cell";
//    SettingsTableViewCell *cell = (SettingsTableViewCell *)[tableView
//                                                        dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    if (cell == nil) {
//        cell = [[SettingsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    
//    switch (indexPath.section)
//            {
//                case ProfileSectionSearchMe:
//    
//                    cell.searchMe.text = @"find me";
//                    
//                    break;
//    
//                default:
//                    break;
//            }
//
//    return cell;
//}

//- (void) buildTableView {
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    self.tableView.frame = self.view.bounds;
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.tableView.backgroundColor = [UIColor whiteColor];
//
////    [self.tableView registerClass:[ProfileHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
//    [self.view addSubview:self.tableView];
//
//    //- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//    //{
//    //    return 100.0;
//    //}
//
//
//
//
////******** THE OLD CODE ********
//
////#import "PublishedProfileTableViewController.h"
////#import "ProfileTableViewController.h"
////#import <Parse/Parse.h>
////#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
////#import "SettingsTableViewController.h"
////#import "ProfileHeaderView.h"
////#import "UIViewController+Alert.h"
////
////
////typedef NS_ENUM(NSUInteger, ProfileSection) {
////
////    ProfileSectionSearchMe = 0,
////    ProfileSectionSearchTime,
////    ProfileSectionSearchLocation,
////    ProfileSectionSearchNew,
////    ProfileSectionSettings
////
////};
////
////@interface SettingsTableViewController ()
////
////@end
////
////
////
////@implementation SettingsTableViewController
////
////- (void)viewDidLoad {
////    [super viewDidLoad];
////    
////    [self buildTableView];
////    // Uncomment the following line to preserve selection between presentations.
////    // self.clearsSelectionOnViewWillAppear = NO;
////    
////}
////
////
////
////- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
////
////    // Return the number of sections.
////    return 5;
////}
////
////- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
////
////    // Return the number of rows in the section.
////    return 1;
////}
////
////
////
////
////
////- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
////    
////    {NSString *identifier = [@(indexPath.section) stringValue];
////    SettingsTableViewController *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
////        
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
////    
////        if (cell == nil)
////        {
////            cell = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 50)];
////    
////        }
////        
////        
////        switch (indexPath.section)
////        {
////            case ProfileSectionSearchMe:
////                
////                cell.searchMeCell.titleLabel.text = @"find me";
////                [searchMeCell setTitle:@"find me" forState:UIControlStateNormal];
////                break;
////                
////            default
////                break;
////        }
////        
////    
////    return cell;
////}
////
////}
////
////
////
////- (void) buildTableView {
////    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
////    self.tableView.frame = self.view.bounds;
////    self.tableView.delegate = self;
////    self.tableView.dataSource = self;
////    self.navigationItem.rightBarButtonItem = self.editButtonItem;
////    self.tableView.backgroundColor = [UIColor whiteColor];
////    
//////    [self.tableView registerClass:[ProfileHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
////    [self.view addSubview:self.tableView];
////    
////    //- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
////    //{
////    //    return 100.0;
////    //}
////
//// 
////
////
////}

//    
//    

@end
