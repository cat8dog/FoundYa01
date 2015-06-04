//
//  Annotation.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-02.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

-(id)initWithLocation:(CLLocationCoordinate2D)coords
{
    self = [super init];
    if (self)
    {
        self.coordinate = coords;
    }
    return self;
}
@end
