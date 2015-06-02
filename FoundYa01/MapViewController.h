//
//  MapViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-01.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)

@interface MapViewController : UIViewController <MKMapViewDelegate, MKAnnotation>


@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end
