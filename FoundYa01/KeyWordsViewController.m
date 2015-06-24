
#import "KeyWordsViewController.h"

@interface KeyWordsViewController ()

@end

@implementation KeyWordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Creating navigation path for Done button to take user back to Circle button on map
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapDoneButton:)];
}

- (void)didTapDoneButton:(id)sender
{
    
    if (self.keyEntry1.text.length > 0)
    {
        [self.delegate didSaveKeyWords:self.keyEntry1.text onViewController:self];
    }
}



@end
