//
//  PublishedProfileTableViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-17.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//



#import <UIKit/UIKit.h>

@class PublishedProfileTableViewController;
@protocol PublishedProfileTableViewControllerDelegate <NSObject>

@end

@interface PublishedProfileTableViewController : UITableViewController <NSURLConnectionDelegate,UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, assign) BOOL didAriveFromFirstTimeSignUp;


// UITableView row data properties
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) UITextField *locationField;
@property (nonatomic, strong) UITextField *genderField;
@property (nonatomic, strong) UITextField *birthdayField;
@property (nonatomic, strong) UITextField *bioField;
@property (strong, nonatomic) UIButton *saveButton;

@property (nonatomic, strong) UITableView *tableView;

@end
