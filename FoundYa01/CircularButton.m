//
//  CircularButton.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-03.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "CircularButton.h"

@implementation CircularButton


- (instancetype)initWithRadius:(CGFloat)radius
{
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, radius * 2.0f, radius * 2.0f)];
    if (self)
    {
        self.layer.cornerRadius = radius;
    }
    return self;
}

@end
