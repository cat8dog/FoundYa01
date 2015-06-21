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
        [self addTarget:self action:@selector(didTouchButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
- (void) didTouchButton {
    NSLog(@"TOUCH MEEEEEEEE! %i", self.miniCircleID);
    switch (self.miniCircleID) {
        case 0:
            NSLog(@"Leave a note!");
            break;
        case 1:
            NSLog(@"Find that guuuurl");
            break;
        default:
            break;
    }
}

@end
