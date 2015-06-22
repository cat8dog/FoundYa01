//
//  Pin.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-18.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "Pin.h"
#import <Parse/PFSubclassing.h>
//static NSString *const kFYPinLocationKey = @"location";
//static NSString *const kFYPinUserKey = @"author";
//static NSString *const kFYPinUserNameKey = @"userName";
//static NSString *const kFYPinDropDateKey = @"pinDropDate";

@implementation Pin
//@dynamic location;
@dynamic pinDropDate;
@dynamic author;
@dynamic location;
@dynamic message;

- (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake(self.location.latitude, self.location.longitude);
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
    self.location = [PFGeoPoint geoPointWithLatitude:coordinate.latitude longitude:coordinate.longitude];
}

//{
//    PFUser *_author;
//    NSDate *_pinDropDate;
//}

//+ (instancetype)pinWithCoordinate:(CLLocationCoordinate2D)coordinate
//{
//    Pin *pin = [[Pin alloc] initWithClassName:@"Pins"];
//    pin.coordinate = coordinate;
//    return pin;
//}
//
//- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
//{
//    Pin *pin = self;
//    pin[kFYPinLocationKey] = [PFGeoPoint geoPointWithLatitude:coordinate.latitude longitude:coordinate.longitude];
//    if ([PFUser currentUser].username) {
//        pin[kFYPinUserNameKey] = [PFUser currentUser].username;//[k];
//    }
//}
//
//
//- (void)setPinDropDate:(NSDate *)pinDropDate {
//    _pinDropDate = pinDropDate;
//    Pin *pin = self;
//    if (pinDropDate)
//    {
//        pin[kFYPinDropDateKey] = pinDropDate;
//    }
//}
//
//
//- (NSDate *)pinDropDate {
//    if(_pinDropDate) {
//        return _pinDropDate;
//    }
//    [self fetchIfNeeded];
//    _pinDropDate = self[kFYPinDropDateKey];
//    return _pinDropDate;
//}
//
//- (CLLocationCoordinate2D)coordinate
//{
//    Pin *pin = self;
//    PFGeoPoint *geoPoint = pin[kFYPinLocationKey];
//    return CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude);
//}
//
//- (void)setAuthor:(PFUser *)author
//{
//    Pin *pin = self;
//    if (author)
//    {
//        pin[kFYPinUserKey] = [PFObject objectWithoutDataWithClassName:@"_User" objectId: author.objectId];
//    }
//}
//
//- (PFUser *)author
//{
//    if (_author)
//    {
//        return _author;
//    }
//    
//    [self fetchIfNeeded];
//    _author = self[kFYPinUserKey];
//    return _author;
//}
//
//+ (Pin *)pinWithObject:(PFObject *)object
//{
//    Pin *pin = [[Pin alloc] initWithClassName:@"Pins"];
//    pin.author = [object objectForKey:@"author"];
//    PFGeoPoint *geoPoint = object[@"location"];
//    pin.coordinate = CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude);
//    pin.pinDropDate = object[@"pinDropDate"];
//    return pin;
//}
//
//+ (NSArray *)pinsWithObjects:(NSArray *)objects
//{
//    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:10];
//    for (PFObject *object in objects)
//    {
//        Pin *pin = [[self class] pinWithObject:object];
//        [array addObject:pin];
//    }
//    return array;
//}

+ (NSString *)parseClassName
{
    return @"Pins";
}

@end
