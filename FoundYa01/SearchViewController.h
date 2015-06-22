
#import <UIKit/UIKit.h>

@class SearchViewController;
@protocol SearchViewControllerDelegate <NSObject>

-(void)didSaveSearch:(NSString *)searchItems onViewController:(SearchViewController *)searchVC;

@end

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) id <SearchViewControllerDelegate> delegate;

@end
