//
//  Pin.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-18.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <Parse/Parse.h>
#import <MapKit/MapKit.h>

@interface Pin : PFObject<MKAnnotation, PFSubclassing>

@property (nonatomic, strong) PFUser *author;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSDate *pinDropDate;
@property (nonatomic, strong) PFGeoPoint *location;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *wordmatch;
@property (nonatomic, copy) NSMutableDictionary *searchOptionsID;
//
////@property (nonatomic, readonly, copy) NSString *title;
////@property (nonatomic, readonly, copy) NSString *subtitle;
//
//+ (Pin *)pinWithCoordinate:(CLLocationCoordinate2D)coordinate;
//+ (Pin *)pinWithObject:(PFObject *)object;
//+ (NSArray *)pinsWithObjects:(NSArray *)objects;

@end
