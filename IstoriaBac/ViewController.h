//
//  ViewController.h
//  IstoriaBac
//
//  Created by Binasystems on 5/27/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "CoreData+MagicalRecord.h"
@interface ViewController : UIViewController  <UITableViewDelegate,NSFetchedResultsControllerDelegate>
@property(strong,nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

