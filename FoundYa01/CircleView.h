//
//  CircleView.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-03.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularButton.h"

@class CircleView;
@protocol CircleViewDelegate <NSObject>

- (void)didTapSavingButtonOnCircleView:(CircleView *)circleView;

@end

@interface CircleView : UIView

@property (nonatomic, strong) CircularButton *savingButton;

- (instancetype)initWithRadius:(CGFloat)radius;
@property (nonatomic, weak) id<CircleViewDelegate> delegate;

@end
