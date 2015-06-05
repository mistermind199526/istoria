//
//  PersDetailsViewController.h
//  IstoriaBac
//
//  Created by Binasystems on 5/27/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Personality.h"
@interface PersDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property Personality *personality;

@end
