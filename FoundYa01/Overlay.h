//
//  Overlay.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-02.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CircleView.h"

@interface Overlay : UIView

@property (nonatomic, strong) CircleView *circleView;

@property (nonatomic, strong) UIButton *findButton;

-(void) hideCircle;

@end
