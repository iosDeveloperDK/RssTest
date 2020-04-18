//
//  NewsPresenter.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsPresenter.h"
#import "SettingsViewController.h"
#import "NewsDetailViewController.h"
#import "NSourceReader.h"
#import "SourceModel.h"
#import "NewsDetailConfigurator.h"

@interface NewsPresenter ()

@property (nonatomic, strong) NSMutableArray* models;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, strong) NSFetchRequest* request;

@end

@implementation NewsPresenter

- (instancetype)initWithVC:(id<NewsViewInput,NSFetchedResultsControllerDelegate>) vc {
  self = [super init];
  _models = [NSMutableArray new];
  _view = vc;
  _request = [NSFetchRequest fetchRequestWithEntityName:NEWS_ENTITY_KEY];
  [_request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:XML_PUBDATE_KEY ascending:NO]]];
  [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:_request managedObjectContext:[[NDatabaseService sharedInstance] getContext] sectionNameKeyPath:nil cacheName:nil]];
  [[self fetchedResultsController] setDelegate:_view];
  [self perfomeFetch];
  return self;
}

-(void)perfomeFetch {
  NSError *error = nil;
  [[self fetchedResultsController] performFetch:&error];
  [self.view reloadTable];
}

-(void)viewWillAppeare {
  NSMutableArray* predicates = [NSMutableArray new];
  NSArray* sources = [NSourceReader getSources];
  
  for (NSInteger i = 0; i < [sources count]; i++) {
    SourceModel* source = [sources objectAtIndex:i];
    if (![source isEnabled]) {
      [predicates addObject:[NSString stringWithFormat:@"sourceType != %ld", source._id]];
    }
  }

  if ([predicates count]) {
    [self.request setPredicate:[NSPredicate predicateWithFormat:[predicates componentsJoinedByString:@" AND "]]];
  } else {
    [self.request setPredicate:[NSPredicate predicateWithValue:YES]];
  }

  [self perfomeFetch];
}

- (void)fetchData {
  [self.interactor fetchData:^(NSArray * models, NSError* error) {
    if (error) {
      [self.view showError:error];
    } else {
      [self.view reloadTable];
    }
  }];
}

-(id<NMappingProtocol>)modelForIndexPath:(NSIndexPath*)indexPath {
  return self.fetchedResultsController.fetchedObjects[indexPath.row];
}

- (NSInteger)rowCount {
  return [self.fetchedResultsController.fetchedObjects count];
}

- (void)readNewsForIndexPath:(NSIndexPath *)indexPath {
  NewsDetailViewController* vc = [[NewsDetailViewController alloc] initWithNibName:NSStringFromClass([NewsDetailViewController class]) bundle:nil];
  [NewsDetailConfigurator configureWith:vc];
  [vc.output appendNews:self.fetchedResultsController.fetchedObjects[indexPath.row]];
  [self.router pushVC:vc];
  [self.interactor readNews: self.fetchedResultsController.fetchedObjects[indexPath.row]];
}

- (void)openSettings {
  SettingsViewController* vc = [[SettingsViewController alloc] initWithNibName:NSStringFromClass([SettingsViewController class]) bundle:nil];
  [self.router pushVC:vc];
}

@end
