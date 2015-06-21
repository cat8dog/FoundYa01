//
//  CircleView.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-03.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView
{
    CGFloat _radius;
    NSArray *_buttons;
    UIView *_container;
}

- (instancetype)initWithRadius:(CGFloat)radius
{
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, radius * 2.0f, radius * 2.0f)];
    if (self)
    {
        self.layer.cornerRadius = radius;
        self.backgroundColor = [UIColor greenColor];
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        
        self.savingButton = [[CircularButton alloc] initWithRadius:radius * 0.5];
//        self.savingButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        self.savingButton.backgroundColor = [UIColor orangeColor];
        
        
        [self.savingButton setTitle:@"save" forState:UIControlStateNormal];
        [self.savingButton addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.savingButton];
        _radius = radius;
        _container = [[UIView alloc] initWithFrame:CGRectZero];
//        _container.backgroundColor = [UIColor blueColor];
        _buttons = [self produceButtons:8 radius:15.0f onView:_container];
        [self addSubview:_container];
        [self bringSubviewToFront:_container];
        [self bringSubviewToFront:self.savingButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.savingButton.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGRect boudingBox = CGRectMake(_radius/4.0f, _radius/4.0f, _radius * 1.5f, _radius * 1.5f);
    _container.frame = boudingBox;
    [self bringSubviewToFront:_container];
    [self drawButtons:_buttons forCircleWithBoundingBox:boudingBox];
    [self bringSubviewToFront:self.savingButton];
}

//Produce a list of buttons on the container
- (NSArray *)produceButtons:(NSInteger)number radius:(CGFloat)radius onView:(UIView *)container
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:number];
    for (int i = 0; i < number; i++)
    {
        CircularButton *button = [[CircularButton alloc] initWithRadius:radius];
//        [button addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor whiteColor];
        button.miniCircleID = i;
        [array addObject:button];
        [container addSubview:button];
        [container bringSubviewToFront:button];
    }
    return array;
}

//draw buttons in the array on the circle path.
- (void)drawButtons:(NSArray *)buttons forCircleWithBoundingBox:(CGRect)rect
{
    CGFloat radius = CGRectGetWidth(rect) / 2.0f;
    NSInteger numberOfButtons = buttons.count;
    CGFloat deltaAlpha = M_PI * 2.0f / numberOfButtons;
    CGFloat alpha = 0.0f;
    CGPoint startingPoint = CGPointMake(CGRectGetWidth(rect) / 2.0f, 0.0f);
    CGPoint currentPoint = startingPoint;
    for (int i = 0 ; i < numberOfButtons; i++)
    {
        UIButton *button = buttons[i];
        button.center = currentPoint;
        alpha += deltaAlpha;
        currentPoint.x = startingPoint.x + (radius * sinf(alpha));
        currentPoint.y = startingPoint.y + (radius * (1.0f - cosf(alpha)));
    }
}

- (void) saveClick:(UIButton *)sender{
//    switch (sender.tag) {
//        case 0:
//            break;
//            
//        default:
//            break;
//    }
    [self.delegate didTapSavingButtonOnCircleView:self];
}



@end
