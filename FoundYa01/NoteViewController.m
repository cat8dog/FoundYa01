
#import "NoteViewController.h"

@interface NoteViewController ()

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapDoneButton:)];
}

- (void)didTapDoneButton:(id)sender
{
    if (self.noteTextView.text.length > 0)
    {
       [self.delegate didSaveNote:self.noteTextView.text onViewController:self];
    }
}

@end
