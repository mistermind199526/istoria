//
//  PersonalitatiBacTableViewCell.h
//  IstoriaBac
//
//  Created by Binasystems on 5/27/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PersonalitatiBacTableViewCellDelegate <NSObject>
@end
@interface PersonalitatiBacTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *namePers;

@property (strong, nonatomic) IBOutlet UIImageView *imagePers;
@property (strong, nonatomic) id <PersonalitatiBacTableViewCellDelegate> delegate;
@end
