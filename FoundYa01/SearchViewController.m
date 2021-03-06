
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
    
    _colourArray = [[NSArray alloc] initWithObjects:hairColour0, hairColour1,hairColour2,hairColour3,hairColour4,hairColour5,hairColour6,nil];
    self.showsSelectionIndicator = NO;
    
    NSString *ethnicity0 = @"choose ethnicity";
    NSString *ethnicity1 = @"Hispanic";
    NSString *ethnicity2 = @"American Indian";
    NSString *ethnicity3 = @"Black";
    NSString *ethnicity4 = @"Asian";
    NSString *ethnicity5 = @"White";
    
    
    _ethnicityArray = [[NSArray alloc] initWithObjects:ethnicity0, ethnicity1,ethnicity2,ethnicity3,ethnicity4,ethnicity5,nil];
    self.showsSelectionIndicator = NO;
    
    
    // prepare the done button to return back to the circleView button on the map
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapDoneButton:)];
}


// saving the search info to the search controller (to be sent to Parse when the user saves the pin)
- (void)didTapDoneButton:(id)sender

{
    NSString *chosenHair;
    NSString *ethnicityType;
    NSString *gender;
    NSInteger index1 = [self.hairColour selectedRowInComponent: 0 ];
    NSInteger index2 = [self.ethnicityType selectedRowInComponent: 0];
    
            
    
    if (index1 > 0) {
        chosenHair = _colourArray [index1];
        NSLog(@"you picked a hair colour, %@,", chosenHair);
    }   else {
        chosenHair = @"";
    }
    if (index2 > 0) {
        ethnicityType = _ethnicityArray [index2];
        NSLog(@"you picked an ethnic type, %@,", ethnicityType);
    }   else {
        ethnicityType = @"";
    }

    if (self.searchGender.length > 0){
        NSLog(@"you picked an gender, %@,", self.searchGender);
        gender = self.searchGender;
    } else {
        gender = @"";

    }
    
    NSLog(@" %@ %@ %@", chosenHair, ethnicityType, gender);
    self.searchOpts = [[NSMutableArray alloc] initWithObjects: gender, chosenHair, ethnicityType, nil];

    
  [self.delegate didSaveSearch:self.searchOpts onViewController:self];
    
}


    //self.dictOptions = [[NSMutableDictionary alloc] initWithObjectsAndKeys: self.chosenHair, @"hair", nil];
//-(void)didSaveSearch:(NSMutableArray *)searchItems onViewController:(SearchViewController *)searchVC
//{
//    
//}
    


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.hairColour)
    {
        return _colourArray.count;
    }
    return _ethnicityArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.ethnicityType)
    {
        return _ethnicityArray[row];
    }
    return _colourArray[row];
}

//- (void)stateChanged:(UISwitch *)gender
//{
//    if ([_genderSwitch isOn]) {
//        self.gender.text = @"Female";
//    } else {
//        self.gender.text = @"Male";
//    }
//}

- (IBAction)genderSwitch:(UISwitch *)sender{
    if ([sender isOn]) {
        self.searchGender = @"Female";
        NSLog(@"female");
       // [sender setOn:NO animated:YES];
    } else {
        NSLog(@"male");
        self.searchGender = @"Male";
       // [sender setOn:YES animated:YES];
    }
}

@end
