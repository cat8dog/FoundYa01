//
//  Overlay.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-02.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "Overlay.h"


@implementation Overlay

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.hidden = NO;
    
    {
        UIButton *hideButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        hideButton.frame = CGRectMake(60, 480, 200, 44);
        hideButton.backgroundColor = [UIColor blueColor];
        [hideButton setTitle:@"Hide" forState:UIControlStateNormal];
        [self addSubview:hideButton];
        [hideButton addTarget:self action:@selector(hideCircle) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self)
    {

        self.circleView = [[CircleView alloc] initWithRadius:CGRectGetWidth(frame) * 0.3f];
        [self addSubview:self.circleView];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
   
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.circleView.center = CGPointMake(CGRectGetMidX(self.bounds),
                                         CGRectGetMidY(self.bounds));
}

- (void)hideCircle {
    self.hidden = YES;
}


@end

