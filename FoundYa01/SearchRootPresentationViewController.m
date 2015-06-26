
#import <UIKit/UIKit.h>
#import "SearchRootPresentationViewController.h"
#import "MapViewController.h"
#import "SettingsTableViewController.h"
#import <Parse/Parse.h>
#import "Pin.h"
#define METERS_PER_MILE 1609.344

@interface SearchRootPresentationViewController () <MKAnnotation>



// slide animation
@property (weak, nonatomic) IBOutlet UIView *centreStage;
@property (weak, nonatomic) SettingsTableViewController *centreSettingsViewController;
@property (weak, nonatomic) IBOutlet UIView *stageRight;
@property (weak, nonatomic) MapViewController *rightStageMap;
@property (nonatomic, assign) BOOL isShowingStageRight;

@end

@implementation SearchRootPresentationViewController

{
    Pin *_pin;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.stageRight.frame = CGRectMake(self.stageRight.frame.origin.x
                                       + self.stageRight.frame.size.width,
                                       self.stageRight.frame.origin.y,
                                       self.stageRight.frame.size.width,
                                       self.stageRight.frame.size.height);
    self.isShowingStageRight = NO;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.locationManager = [[CLLocationManager alloc] init];
    if(IS_OS_8_OR_LATER)
        
    {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    _mapView.showsUserLocation = YES;
    _mapView.showsPointsOfInterest = YES;
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString* reuseID = @"reuseID";
    // if no pin can be dequeued then we create one
    MKAnnotationView *view=[_mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
    
    if (!view)
    {
        view=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseID];
        view.image = [UIImage imageNamed:@"poop_smiley1"];
    }
    
    return view;
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        
        // 3
        [_mapView setRegion:viewRegion animated:YES];
    });
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    [mapView deselectAnnotation:view.annotation animated:NO];
    self.overlay.hidden = NO;
    [mapView setCenterCoordinate:[view.annotation coordinate] animated:YES];
    [self.view bringSubviewToFront:self.overlay];
    
    
}

//- (void) viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    self.stageRight.frame = CGRectMake(self.stageRight.frame.origin.x
//                                       + self.stageRight.frame.size.width,
//                                       self.stageRight.frame.origin.y,
//                                       self.stageRight.frame.size.width,
//                                       self.stageRight.frame.size.height);
//    self.isShowingStageRight = NO;
//    
//    
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"centreInclusion"]) {
        self.centreSettingsViewController = (SettingsTableViewController *)(segue.destinationViewController);
    } else if ([segue.identifier isEqualToString:@"rightInclusion"]) {
        self.rightStageMap = (MapViewController *)(segue.destinationViewController);
    }
    if(self.centreSettingsViewController && self.rightStageMap) {
        self.centreSettingsViewController.delegate = self.rightStageMap;
    }
}

- (IBAction)backSelected:(UIBarButtonItem *)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Search Root Presentation View was dissmissed");
    }];
}
- (IBAction)toggleStageRight:(UIBarButtonItem *)sender {
    if (self.isShowingStageRight) {
        self.isShowingStageRight = NO;
        self.stageRight.frame = CGRectMake(self.stageRight.frame.origin.x
                                           + self.stageRight.frame.size.width,
                                           self.stageRight.frame.origin.y,
                                           self.stageRight.frame.size.width,
                                           self.stageRight.frame.size.height);
    } else {
        self.isShowingStageRight = YES;
        self.stageRight.frame = CGRectMake(self.stageRight.frame.origin.x
                                           - self.stageRight.frame.size.width,
                                           self.stageRight.frame.origin.y,
                                           self.stageRight.frame.size.width,
                                           self.stageRight.frame.size.height);
    }
}

@end
