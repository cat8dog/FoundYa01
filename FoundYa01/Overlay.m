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
    
    {
        UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        findButton.frame = CGRectMake(60, 100, 200, 44);
        findButton.backgroundColor = [UIColor blueColor];
        [findButton setTitle:@"Find" forState:UIControlStateNormal];
        [self addSubview:findButton];
        [findButton addTarget:self action:@selector(findOptions:) forControlEvents:UIControlEventTouchUpInside];
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


@end

