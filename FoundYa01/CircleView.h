//
//  CircleView.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-03.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularButton.h"

@interface CircleView : UIView

@property (nonatomic, strong) CircularButton *savingButton;

- (instancetype)initWithRadius:(CGFloat)radius;

@end
