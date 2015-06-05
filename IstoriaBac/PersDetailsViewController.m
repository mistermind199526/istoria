//
//  PersDetailsViewController.m
//  IstoriaBac
//
//  Created by Binasystems on 5/27/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//

#import "PersDetailsViewController.h"
#import  "Masonry/Masonry.h"
#import <CoreText/CoreText.h>
#import "Image.h"

@interface PersDetailsViewController ()

@end

@implementation PersDetailsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title=self.personality.name;
    
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(-20);
        make.right.equalTo(self.view.mas_right).offset(-2);
        make.left.equalTo(self.view.mas_left).offset(2);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-2);
    }];
    

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.personality.descriptions];
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
        Image *image=[self.personality.images anyObject];
        
        if (image) {
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:image.url]];
            textAttachment.image = [UIImage imageWithData:imageData];
        }
        CGFloat oldWidth = textAttachment.image.size.width;
        
        
        CGFloat scaleFactor = oldWidth / (self.textView.frame.size.width - 10);
        textAttachment.image = [UIImage imageWithCGImage:textAttachment.image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
        NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
        [attributedString replaceCharactersInRange:NSMakeRange(0, 0) withAttributedString:attrStringWithImage];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.attributedText = attributedString;
        });
    });
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
