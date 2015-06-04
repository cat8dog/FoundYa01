//
//  MapViewController.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-01.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "MapViewController.h"
#define METERS_PER_MILE 1609.344
#import "Overlay.h"

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
    
    
    _mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_mapView];
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    
    if(IS_OS_8_OR_LATER)
        
    {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
        
        _mapView.showsUserLocation = YES;
        _mapView.showsPointsOfInterest = YES;
    
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    findButton.frame = CGRectMake(150, 30, 120, 60);
    findButton.backgroundColor = [UIColor blackColor];
    [findButton setTitle:@"find" forState:UIControlStateNormal];
    [_mapView addSubview:findButton];
    [findButton addTarget:self action:@selector(getOptions:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
    

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
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
}

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

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    Overlay *overlay = [[Overlay alloc] initWithFrame:self.view.bounds];
   
    [self.view addSubview:overlay];
    [self.view bringSubviewToFront:overlay];
//}
//
    
}
-(void)getOptions:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"findOptions" sender:self];
    
    //[self presentViewController:<#(UIViewController *)#>FindViewController animated:YES];
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
