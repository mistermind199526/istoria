//
//  PersonalitatiBacTableViewCell.m
//  IstoriaBac
//
//  Created by Binasystems on 5/27/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//

#import "PersonalitatiBacTableViewCell.h"
#import  "Masonry/Masonry.h"
#import <CoreText/CoreText.h>
@implementation PersonalitatiBacTableViewCell





- (void)awakeFromNib {
    
        [self.imagePers mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left).offset(2);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
    [self.namePers mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.top.equalTo(self.contentView.mas_top).offset(-10);
        maker.right.equalTo(self.contentView.mas_right);
        maker.left.equalTo(self.imagePers.mas_left);
        maker.bottom.equalTo(self.contentView.mas_bottom);
    }];

    
    }


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
