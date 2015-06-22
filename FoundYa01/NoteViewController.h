
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
