//
//  Annotation.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-02.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;



-(id)initWithLocation:(CLLocationCoordinate2D)coords;

@end
