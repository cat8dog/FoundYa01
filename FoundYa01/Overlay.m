
#import "Overlay.h"


@implementation Overlay

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.hidden = NO;
    
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

