
#import "SearchViewController.h"

@interface SearchViewController ()


@end

@implementation SearchViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *hairColour0 = @"choose hair";
    NSString *hairColour1 = @"blonde";
    NSString *hairColour2 = @"brown";
    NSString *hairColour3 = @"black";
    NSString *hairColour4 = @"red";
    NSString *hairColour5 = @"grey";
    NSString *hairColour6 = @"white";
    _colourArray = [[NSArray alloc] initWithObjects:hairColour1,hairColour2,hairColour3,hairColour4,hairColour5,hairColour6,nil];
    self.showsSelectionIndicator = NO;
    
    // prepare the done button to return back to the circleView button on the map
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapDoneButton:)];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _colourArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
   return [_colourArray objectAtIndex:row];
   
}





// saving the search info to the search controller (to be sent to Parse when the user saves the pin)
- (void)didTapDoneButton:(id)sender

{
    NSString *chosenHair;
    NSInteger index = [self.hairColour selectedRowInComponent: 0 ];
    if (index > 0) {
        chosenHair = _colourArray [index];
        NSLog(@"wiasdhgoiagj, %@,", chosenHair);
    }   else {
        chosenHair = @"";
    }
    
    
//        if (self.gender.text.length > 0){
//            gender?
//        } else {
//    
//        }
    
    self.searchOpts = [[NSMutableArray alloc] initWithObjects: chosenHair];
//        self.searchOpts = [[NSMutableArray alloc] initWithObjects: chosenHair, chosenGender, chosenEthnicity]
    
//    [self didSaveSearch:self.searchOpts onViewController:]
    
}


    //self.dictOptions = [[NSMutableDictionary alloc] initWithObjectsAndKeys: self.chosenHair, @"hair", nil];
    -(void)didSaveSearch:(NSMutableArray *)searchItems onViewController:(SearchViewController *)searchVC;
{
    
}
    




@end
