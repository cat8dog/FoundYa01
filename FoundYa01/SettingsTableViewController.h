//
//  SettingsTableViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-17.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsTableViewControllerDelegate <NSObject>

@end

@interface SettingsTableViewController : UITableViewController <NSURLConnectionDelegate,UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) UITextField *locationField;
@property (nonatomic, strong) UITextField *dateTimeField;
@property (nonatomic, strong) UITextField *searchMeField;
@property (nonatomic, strong) UITextField *searchNewField;
@property (nonatomic, strong) UITextField *settingsField;

//@property (nonatomic, strong) UITableView *tableView;

@end
