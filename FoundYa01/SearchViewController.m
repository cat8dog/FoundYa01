
#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // prepare the done button to return back to the circleView button on the map
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapDoneButton:)];
}
// saving the search info to the search controller (to be sent to Parse when the user saves the pin)
- (void)didTapDoneButton:(id)sender
{
    if (self.gender.text.length > 0)
    {
        [self.delegate didSaveSearch:self.gender.text onViewController:self];
    }
}



@end
