//
//  CircleView.h
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-03.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularButton.h"

typedef NS_ENUM(NSUInteger, PinOption) {
    PinOptionNote = 0,
    PinOptionKeyWords = 1,
    PinOptionSearch = 2,
    PinOptionPasslock = 3,
    PinOptionPhoto = 4,
    PinOptionSocial = 5,
    PinOptionCustom = 6,
    PinOptionSave = 100,
};

@class CircleView;
@protocol CircleViewDelegate <NSObject>

- (void)didTapSavingButtonOnCircleView:(CircleView *)circleView;
- (void)didTapButton:(UIButton *)button;

@end

@interface CircleView : UIView

@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSMutableArray *searchOpts;
@property (nonatomic, strong) NSString *security;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *socialMedia;
@property (nonatomic, strong) NSString *customProfile;
@property (nonatomic, strong) NSDate *pinDropDate;

@property (nonatomic, strong) CircularButton *savingButton;
@property (nonatomic, weak) id<CircleViewDelegate> delegate;

- (instancetype)initWithRadius:(CGFloat)radius;
- (void)show;
- (void)dismiss;

@end
