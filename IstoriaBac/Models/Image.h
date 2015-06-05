//
//  Image.h
//  IstoriaBac
//
//  Created by Binasystems on 6/1/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Personality;

@interface Image : NSManagedObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * remoteId;
@property (nonatomic, retain) Personality *personality;

@end
