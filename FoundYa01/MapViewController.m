
#import "MapViewController.h"
#import "LogInViewController.h"
#import "Pin.h"
#import <Parse/Parse.h>
#import "DateTimeViewController.h"
#define METERS_PER_MILE 1609.344


@interface MapViewController () <CircleViewDelegate, MKAnnotation, NoteViewControllerDelegate, KeyWordsViewControllerDelegate,SearchViewControllerDelegate, DateTimeViewControllerDelegate>

@end

@implementation MapViewController
{
    Pin *_pin;
}

// adjust below to former [self.navigationController popViewControllerAnimated:YES]; once finished.
- (IBAction)popLogin:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Map View";
        self.tabBarItem.image = [UIImage imageNamed:@"Map View"];
        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.overlay = [[Overlay alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.overlay];
    self.overlay.hidden = YES;
    self.overlay.circleView.delegate = self;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnOverlay:)];
    [self.overlay addGestureRecognizer:tapGesture];

    self.locationManager = [[CLLocationManager alloc] init];
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didLongPress:)];
    longGesture.minimumPressDuration = 1.0;
    
    [_mapView addGestureRecognizer:longGesture];
    if(IS_OS_8_OR_LATER)
        
    {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
        
        _mapView.showsUserLocation = YES;
        _mapView.showsPointsOfInterest = YES;
    
    UIButton *changeDateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    changeDateButton.frame = CGRectMake(150, 80, 100, 60);
    changeDateButton.backgroundColor = [UIColor blackColor];
    [changeDateButton setTitle:@"change date" forState:UIControlStateNormal];
    [_mapView addSubview:changeDateButton];
    [changeDateButton addTarget:self action:@selector(getNewDate:) forControlEvents:UIControlEventTouchUpInside];
    
    // temporary "back" button
    UIButton *tagsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tagsButton.frame = CGRectMake(150, 600, 100, 60);
    tagsButton.backgroundColor = [UIColor blackColor];
    [tagsButton setTitle:@"tags" forState:UIControlStateNormal];
    [_mapView addSubview:tagsButton];
    [tagsButton addTarget:self action:@selector(viewTags:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
    
    PFQuery *query = [Pin query];
    NSDate *now = [NSDate date];
    [query whereKey:@"pinDropDate" lessThan:now];
    __weak typeof(self) weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        [weakSelf.mapView addAnnotations:objects];
    }];
}





- (void)didLongPress:(UILongPressGestureRecognizer *)sender
{
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
//        {
//            NSDate *now = [NSDate date];
//            NSDateComponents *dc = [[NSDateComponents alloc] init];
//            [dc setMonth:3];
//            [dc setDay:4];
//           
//            _MyTargetDateObject = [[NSCalendar currentCalendar] dateByAddingComponents:dc toDate:now options:0];
            
        {
            CGPoint location = [sender locationInView:_mapView];
            CLLocationCoordinate2D coordinate = [_mapView convertPoint:location toCoordinateFromView:_mapView];
            
            [_mapView setCenterCoordinate:coordinate animated:YES];
            self.overlay.hidden = NO;
            Pin *pin = [Pin object];
            pin.author = [PFUser currentUser];
//            pin.searchOptionsID = [PFRelation searchOpts];
            pin.pinDropDate = [NSDate date];
            pin.coordinate = coordinate;
            _pin = pin;
        }
            break;
            
        default:
            break;
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
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

// ******* method for changing new Date & Time

-(void)getNewDate:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"getNewDate" sender:self];
    

}

-(void)viewTags:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"viewTags" sender:self];
    
}

- (void)didTapOnOverlay:(id)sender {
    self.overlay.hidden = YES;
}

- (void)didTapButton:(UIButton *)button
{
    PinOption option = button.tag;
    NSLog(@"BUTTON TAP TAG! %i", option);
    switch (option)
    {
        case PinOptionNote:
        {
            NSLog(@"Notes!");
            UIStoryboard *storyMain = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            NoteViewController *noteViewController = [storyMain instantiateViewControllerWithIdentifier:@"NoteViewController"];
            noteViewController.modalPresentationStyle = UIModalPresentationFormSheet;
            noteViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            noteViewController.preferredContentSize = CGSizeMake(325, 75); // size of popup view
            noteViewController.delegate = self;
            [self.navigationController pushViewController:noteViewController animated:YES];
        }
            break;
        
        case PinOptionKeyWords:
        {
            NSLog(@"KEysysyso");
            UIStoryboard *storyMain = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            KeyWordsViewController *keyWordsViewController = [storyMain instantiateViewControllerWithIdentifier:@"KeyWordsViewController"];
            keyWordsViewController.modalPresentationStyle = UIModalPresentationFormSheet;
            keyWordsViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            keyWordsViewController.preferredContentSize = CGSizeMake(325, 75); // size of popup view
            keyWordsViewController.delegate = self;
            [self.navigationController pushViewController:keyWordsViewController animated:YES];
            
        }
            break;
         
        case PinOptionSearch:
        {
            NSLog(@"Searchhhh!");
            UIStoryboard *storyMain = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            SearchViewController *searchViewController = [storyMain instantiateViewControllerWithIdentifier:@"SearchViewController"];
            searchViewController.modalPresentationStyle = UIModalPresentationFormSheet;
            searchViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            searchViewController.preferredContentSize = CGSizeMake(325, 75); // size of popup view
            searchViewController.delegate = self;
            [self.navigationController pushViewController:searchViewController animated:YES];
        }
            break;
        
            
        default: {
            // do nothing
        }
            break;
    }
}

- (void)didSaveNote:(NSString *)note onViewController:(NoteViewController *)noteVC
{
    self.overlay.circleView.note = note;
}

- (void)didSaveKeyWords:(NSString *)keywords onViewController:(KeyWordsViewController *)keywordsVC {
    self.overlay.circleView.keywords = keywords;
}

- (void)didSaveSearch:(NSMutableArray *)searchOpts onViewController:(SearchViewController *)searchVC {
    self.overlay.circleView.searchOpts = searchOpts;
}

- (void)didTapSavingButtonOnCircleView:(CircleView *)circleView
{
    if (_pin)
    
        
    {  
        
        if (circleView.note)
        {
           _pin.message = circleView.note;
        }
        [_pin saveInBackground];
        
        if (circleView.keywords)
            {
                _pin.wordmatch = circleView.keywords;
            }
            [_pin saveInBackground];
        if (circleView.searchOpts)
                {
                    NSString *gender = [circleView.searchOpts objectAtIndex:0];
                    NSString *hair = [circleView.searchOpts objectAtIndex:1];
                    NSString *ethnicity = [circleView.searchOpts objectAtIndex:2];
                    
                    _pin.gender = gender;
                    _pin.hair = hair;
                    _pin.ethnicity = ethnicity;
                
                    
                    NSLog(@"%@", circleView.searchOpts);
                    [_pin saveInBackground];
                }
        
    }
    
    self.overlay.hidden = YES;
}

- (void)didSaveDateTime:(PFQuery *)query onViewController:(DateTimeViewController *)DateTimeVC
{
    __weak typeof(self) weakself = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        __strong typeof(self) strongSelf = weakself;
        [strongSelf.mapView removeAnnotations:strongSelf.mapView.annotations];
        [strongSelf.mapView addAnnotations:objects];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"getNewDate"])
    {
        DateTimeViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}

@end
