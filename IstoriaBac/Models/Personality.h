//
//  Personality.h
//  IstoriaBac
//
//  Created by Binasystems on 6/1/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Image;

@interface Personality : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSNumber * remoteId;
@property (nonatomic, retain) NSSet *images;
@end

@interface Personality (CoreDataGeneratedAccessors)

- (void)addImagesObject:(Image *)value;
- (void)removeImagesObject:(Image *)value;
- (void)addImages:(NSSet *)values;
- (void)removeImages:(NSSet *)values;

@end
