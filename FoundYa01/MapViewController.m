//
//  MapViewController.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-01.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "MapViewController.h"


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
   
    
    
    
    
    if(IS_OS_8_OR_LATER)
        
    {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    
    {
        [self.locationManager startUpdatingLocation];
        
        _mapView.showsUserLocation = YES;
        _mapView.showsPointsOfInterest = YES;
    }
    // Do any additional setup after loading the view.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString* reuseID = @"reuseID";
    // if no pin can be dequeued then we create one
    MKAnnotationView *view=[_mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
    
    
    {
        view=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseID];
        view.image = [UIImage imageNamed:@"poop_smiley1"];
        //UIImageView* image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 46, 46)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paper_towl"]];
        view.leftCalloutAccessoryView = imageView;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.canShowCallout=YES;
        //view.animatesDrop = YES;
        view.enabled = YES;
        
        
    }
    
    view.annotation=annotation;
    
    return view;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in _mapView.annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(zoomRect))
        {
            zoomRect = pointRect;
        } else
        {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
    }
    [_mapView setVisibleMapRect:zoomRect animated:YES];
    
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
