//
//  MapViewController.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-01.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "MapViewController.h"
#define METERS_PER_MILE 1609.344


@interface MapViewController ()

@end

@implementation MapViewController


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
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnOverlay:)];
    [self.overlay addGestureRecognizer:tapGesture];
    //_mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    //[self.view addSubview:_mapView];
    //self.mapView.delegate = self;
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
    CGPoint location = [sender locationInView:_mapView];
    CLLocationCoordinate2D coordinate = [_mapView convertPoint:location toCoordinateFromView:_mapView];
    
//    Annotation *annotation = [[Annotation alloc] initWithLocation:coordinate];
//    [_mapView addAnnotation:coordinate];
//    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, 0.1*METERS_PER_MILE, 0.1*METERS_PER_MILE);
    
//    // 3
//    [_mapView setRegion:viewRegion animated:YES];
    self.overlay.hidden = NO;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString* reuseID = @"reuseID";
    // if no pin can be dequeued then we create one
    MKAnnotationView *view=[_mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
    
    if (!view)
    {
        view=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseID];
        view.image = [UIImage imageNamed:@"poop_smiley1"];
        
//        //UIImageView* image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 46, 46)];
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paper_towl"]];
//        view.leftCalloutAccessoryView = imageView;
//        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        view.canShowCallout=YES;
//        //view.animatesDrop = YES;
//        view.enabled = YES;
    }
    
//    view.annotation=annotation;
    
    
    return view;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Location points downtown Toronto
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 43.642566;
    zoomLocation.longitude= -79.387057;
    Annotation *annotation = [[Annotation alloc] initWithLocation:zoomLocation];
    [_mapView addAnnotation: annotation];
    
    // Zoom function: region made around user location centre point with a given width / height
  }

// AlertView (Callout for pin Preview)
//- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
//{
//    // annotation
//    Annotation *annotation = (Annotation *)view.annotation;
//    //deselect
//    [self.mapView deselectAnnotation:annotation animated:YES];
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paper_towl"]];
//    view.leftCalloutAccessoryView = imageView;
//    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//    view.canShowCallout=YES;
//    //view.animatesDrop = YES;
//    view.enabled = YES;
//}

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

-(void)getOptions:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"getOptions" sender:self];
    

}

-(void)viewTags:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"viewTags" sender:self];
    
}

- (IBAction)pushDiscoverView:(id)sender {
    UIViewController *discoverViewController = (UIViewController *)[[UIStoryboard storyboardWithName:@"Main"
    bundle:nil] instantiateViewControllerWithIdentifier:@"DiscoverViewController"];
    [self.navigationController pushViewController:discoverViewController animated:YES];
}

- (void)didTapOnOverlay:(id)sender {
    self.overlay.hidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
