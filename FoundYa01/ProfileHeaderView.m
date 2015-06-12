//
//  ProfileHeaderView.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-11.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "ProfileHeaderView.h"

@implementation ProfileHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
       self.avatarView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.avatarView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.avatarView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.avatarView.frame = self.contentView.bounds;
//    self.avatarView.frame = self.bounds;
}
@end
