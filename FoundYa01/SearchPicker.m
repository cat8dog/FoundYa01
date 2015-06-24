//
//#import "SearchPicker.h"
//
//
//
//
//@implementation SearchPicker
//
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//    //Return the number of components
//    return 1;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//    //Return the number of rows in the component
//    return 1;
//}
//
//#pragma mark -
//#pragma Picker View Delegate methods
//
////Set the dimensions of the picker view.
//
// - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
// {
// return 40.0f;
// }
//
//
//
// - (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
// {
// return 200.f;
// }
//
//
////The methods in this group are marked @optional. However, to use a picker view, you must implement either the pickerView:titleForRow:forComponent: or the pickerView:viewForRow:forComponent:reusingView: method to provide the content of component rows.
////If both pickerView:titleForRow:forComponent: and pickerView:attributedTitleForRow:forComponent: are implemented, attributed title is favored.
//
//// Return a string representing the title for the given row.
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    return [dataSource objectAtIndex:row];
//    return @"Nil";
//}
//
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    if (view != nil)
//    {
//        return view;
//    }
//    else
//    {
//        UIView* view;
//        view.backgroundColor = [UIColor whiteColor];
//        return view;
//    }
//}
//
//
//@end
