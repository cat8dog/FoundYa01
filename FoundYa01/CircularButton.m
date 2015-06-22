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
            // Create a VC with a textfield (bounds) for the user to write a note. UI goal: pops out from screen centre, but doesn't consume entire mapView screen.  When done, note dissapears the same way into the centre.
            // Ask James how to recreate this feature programatically (based on lecture using storyboard).
            NSLog(@"Leave a note!");
            break;
        case 1:
            // Create a TVC with simple, forced (scroll selected) parameters, ie. hair colour, bodytype, height-range
            NSLog(@"Find that guuuurl");
            break;
        case 2:
            // Create a VC with 2 or 3 locked-in filters (ie. "name of venue", plus text-field entries for user optional words.
            NSLog(@"Keywords");
            break;
        case 3:
            // create a UIView with a textfield where a user can enter a password that only the person they're searching for would know.  This will hide their profile, revealing only their note to the public.
            NSLog(@"password lock");
        case 4:
            // Camera : either take a photo or load one from phone library, with the intention of saving it to the pin.
            NSLog(@"take/load a photo!");
            break;
        case 5:
            // Create a UIView (iPhone has this functionality built-in somewhere), with a table-view list of social media sites.  The user can select one of these (or more?) to add to the pin, as an invitation for whomever they're looking for to, ie. join their Twitter stream or Facebook Page.
            NSLog(@"Invite to social media!");
            break;
        default:
            break;
    }
}

@end
