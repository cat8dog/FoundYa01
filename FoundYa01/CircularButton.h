//
//  CircularButton.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-03.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteViewController.h"

@interface CircularButton : UIButton


@property (nonatomic, assign) NSInteger miniCircleID;
- (instancetype)initWithRadius:(CGFloat)radius;

@end
