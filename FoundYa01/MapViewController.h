//
//  MapViewController.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-01.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "Overlay.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)




@interface MapViewController : UIViewController <MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) UIButton *changeDateButton;
@property (strong, nonatomic) UIButton *tagsButton;
@property (strong, nonatomic) Overlay *overlay;
@property (strong, nonatomic) NSCalendar *MyTargetDateObject;
@property (strong, nonatomic) NSMutableDictionary *searchItems;


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


-(void) getOptions;
-(void) unwindToLogin;



@end
