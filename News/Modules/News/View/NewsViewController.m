//
//  NewsViewController.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "NRequestService.h"
#import "NConfigProtocol.h"
#import "NewsConfigurator.h"

@interface NewsViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray* models;
@property (nonatomic, strong) UIRefreshControl* refresh;

@end

@implementation NewsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)configuration {
  [NewsConfigurator configureWith:self];
  [self.output fetchData];
  self.models = [NSMutableArray new];
}

- (void)configurationView {
  self.title = NEWS_NAV_TITLE;
  
  NSString* indetifier = NSStringFromClass([NewsTableViewCell class]);
  [self.tableView registerNib:[UINib nibWithNibName:indetifier bundle:nil] forCellReuseIdentifier:indetifier];
  [self.tableView setRowHeight:UITableViewAutomaticDimension];
  [self.tableView setContentInset:UIEdgeInsetsMake(16, 0, 0, 0)];
  
  UIBarButtonItem* settings = [[UIBarButtonItem alloc] initWithTitle:SETTINGS_NAV_TITLE style:UIBarButtonItemStyleDone target:self.output action:@selector(openSettings)];
  self.navigationItem.rightBarButtonItem = settings;
  
  self.refresh = [UIRefreshControl new];
  [self.tableView addSubview:self.refresh];
  
  [self.refresh addTarget:self.output action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  [self.output viewWillAppeare];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  NSString* indetifier = NSStringFromClass([NewsTableViewCell class]);
  NewsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
  
  if (cell) {
    [cell configuration:[self.output modelForIndexPath:indexPath]];
    return cell;
  }
  
  return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.output rowCount];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.output readNewsForIndexPath:indexPath];
}

- (void)reloadTable {
  [self.refresh endRefreshing];
  [self.tableView reloadData];
}

- (void)showError:(NSError *)error {
  [self showErrorAlert:error];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
  [self reloadTable];
}

@end
