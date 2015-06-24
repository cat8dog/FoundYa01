
#import <UIKit/UIKit.h>

@class SearchViewController;
@protocol SearchViewControllerDelegate <NSObject>

-(void)didSaveSearch:(NSMutableArray *)searchItems onViewController:(SearchViewController *)searchVC;

@end

@interface SearchViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *gender;

@property (weak, nonatomic) id <SearchViewControllerDelegate> delegate;


@property (weak, nonatomic) IBOutlet UIPickerView *hairColour;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic)NSArray *colourArray;
@property (strong, nonatomic)NSString *chosenHair;


// Search Options!!!!!!!!!!!

@property(nonatomic) BOOL showsSelectionIndicator;

@property (nonatomic, strong) NSMutableArray *searchOpts;
@property(strong, nonatomic)NSString *searchGender;
@property(strong, nonatomic)NSString *searchHair;

@end
