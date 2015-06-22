
#import "MapViewController.h"
#import "LogInViewController.h"
#import "Pin.h"
#import <Parse/Parse.h>
#define METERS_PER_MILE 1609.344


@interface MapViewController () <CircleViewDelegate, MKAnnotation, NoteViewControllerDelegate, KeyWordsViewControllerDelegate>

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
    
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    findButton.frame = CGRectMake(150, 80, 100, 60);
    findButton.backgroundColor = [UIColor blackColor];
    [findButton setTitle:@"find" forState:UIControlStateNormal];
    [_mapView addSubview:findButton];
    [findButton addTarget:self action:@selector(getOptions:) forControlEvents:UIControlEventTouchUpInside];
    
    // temporary "back" button
    UIButton *tagsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tagsButton.frame = CGRectMake(150, 600, 100, 60);
    tagsButton.backgroundColor = [UIColor blackColor];
    [tagsButton setTitle:@"tags" forState:UIControlStateNormal];
    [_mapView addSubview:tagsButton];
    [tagsButton addTarget:self action:@selector(viewTags:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
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
    
    PFQuery *query = [Pin query];
    NSDate *now = [NSDate date];
    [query whereKey:@"pinDropDate" lessThan:now];
    __weak typeof(self) weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        [weakSelf.mapView addAnnotations:objects];
    }];
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
    self.overlay.hidden = NO;
    [self.view bringSubviewToFront:self.overlay];
    
    
}

// ******* New method for saving location to parse

//-(void)getOptions:(UIButton *)sender {
//    
//    [self performSegueWithIdentifier:@"getOptions" sender:self];
//    

//}

-(void)viewTags:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"viewTags" sender:self];
    
}

- (void)didTapOnOverlay:(id)sender {
    self.overlay.hidden = YES;
}

- (void)didTapButton:(UIButton *)button
{
    PinOption option = button.tag;
    switch (option)
    {
        case PinOptionNote:
        {
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
            UIStoryboard *storyMain = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            KeyWordsViewController *keyWordsViewController = [storyMain instantiateViewControllerWithIdentifier:@"KeyWordsViewController"];
            keyWordsViewController.modalPresentationStyle = UIModalPresentationFormSheet;
            keyWordsViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            keyWordsViewController.preferredContentSize = CGSizeMake(325, 75); // size of popup view
            keyWordsViewController.delegate = self;
            [self.navigationController pushViewController:keyWordsViewController animated:YES];
            
            
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
    }
    
    self.overlay.hidden = YES;
}

@end
