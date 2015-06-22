//
//  NoteViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-22.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoteViewController;
@protocol NoteViewControllerDelegate <NSObject>

- (void)didSaveNote:(NSString *)note onViewController:(NoteViewController *)noteVC;

@end
@interface NoteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *NoteField;
@property (weak, nonatomic) id <NoteViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextView *noteTextView;

@end
