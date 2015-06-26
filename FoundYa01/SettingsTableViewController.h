#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface SettingsTableViewController : UITableViewController

- (IBAction)searchMe:(UIButton *)sender;
- (IBAction)searchOthers:(UIButton *)sender;

@property (nonatomic, assign) id <MapViewControllerDelegate> delegate;

@end





//********** THE OLD CODE *******

//
//  SettingsTableViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-17.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//@protocol SettingsTableViewControllerDelegate <NSObject>
//
//@end

//@interface SettingsTableViewController : UITableViewController <NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate>
//
//@property (strong, nonatomic) IBOutlet UITableViewCell *searchMeCell;
//@property (strong, nonatomic) IBOutlet UITableViewCell *searchTimeCell;
//@property (strong, nonatomic) IBOutlet UITableViewCell *searchLocationCell;
//@property (strong, nonatomic) IBOutlet UITableViewCell *searchNewCell;
//@property (strong, nonatomic) IBOutlet UITableViewCell *settingsCell;
//
////@property (nonatomic, strong) NSArray *rowTitleArray;
////@property (nonatomic, strong) NSMutableArray *rowDataArray;
////@property (nonatomic, strong) UITextField *searchMeCell;
////@property (nonatomic, strong) UITextField *searchTimeCell;
////@property (nonatomic, strong) UITextField *searchLocationCell;
////@property (nonatomic, strong) UITextField *searchNewCell;
////@property (nonatomic, strong) UITextField *settingsCell;
//
//@property (nonatomic, strong) UITableView *tableView;
//
//@end
