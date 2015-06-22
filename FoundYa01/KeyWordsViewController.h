//
//  KeyWordsViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-22.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyWordsViewController;
@protocol KeyWordsViewControllerDelegate <NSObject>

- (void)didSaveKeyWords:(NSString *)keywords onViewController:(KeyWordsViewController *)keywordsVC;

@end
@interface KeyWordsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *keyEntry1;
@property (weak, nonatomic) id <KeyWordsViewControllerDelegate> delegate;


@end
