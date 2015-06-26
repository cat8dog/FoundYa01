//
//  TextFieldTableViewCell.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-15.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "TextFieldTableViewCell.h"

@interface TextFieldTableViewCell ()

@end

@implementation TextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.textField = [[UITextField alloc] init];
        [self.contentView addSubview:self.textField];
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textField.frame = self.contentView.bounds;
    
}

@end

