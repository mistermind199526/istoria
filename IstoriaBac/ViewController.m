//
//  ViewController.m
//  IstoriaBac
//
//  Created by Binasystems on 5/27/15.
//  Copyright (c) 2015 Binasystems. All rights reserved.
//
#import "AFNetworking.h"
#import "ViewController.h"
#import "PersDetailsViewController.h"
#import "Personality.h"
#import  "Masonry/Masonry.h"
#import <CoreText/CoreText.h>
#import "CoreData+MagicalRecord.h"
#import "PersonalitatiBacTableViewCell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://terra-dacorum.popastefan.com/personality"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             for (NSDictionary *personality in responseObject[@"data"]) {
                 [Personality MR_importFromObject:personality inContext:[NSManagedObjectContext MR_defaultContext]];
             }
             NSError *error;
             if (![[self fetchedResultsController] performFetch:&error]) {
                 NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
             }
             
             [self.tableView reloadData];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
         }];

  

    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *oloi) {
        oloi.top.equalTo(self.view.mas_top);
        oloi.right.equalTo(self.view.mas_right);
        oloi.left.equalTo(self.view.mas_left);
        oloi.bottom.equalTo(self.view.mas_bottom).offset(-2);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonalitatiBacTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonalitatiBacTableViewCell"];
    [self.tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated
{
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return [[self.fetchedResultsController sections] count];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PersonalitatiBacTableViewCell *cell =(PersonalitatiBacTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PersonalitatiBacTableViewCell"];
    Personality *personality = (Personality *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.detailTextLabel.text=personality.name;
   return cell;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersDetailsViewController *pvc = [PersDetailsViewController new];
    pvc.personality = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    [self.navigationController pushViewController:pvc animated:YES];
    
    
}
-(NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [Personality MR_entityDescriptionInContext:[NSManagedObjectContext MR_defaultContext]];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"remoteId" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:nil
                                                   cacheName:nil];
    _fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}


@end
