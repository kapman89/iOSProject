//
//  ABFriendsViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFriendsViewController.h"

#import "ABFriendsView.h"
#import "ABUserCell.h"
#import "ABUsersModel.h"
#import "ABUserDetailViewController.h"
#import "ABArrayModelChange.h"
#import "ABFBGetUserContext.h"
#import "ABFBGetFriendsContext.h"

#import "UITableView+ABExtension.h"

static NSString * const ABNavigationBarTitle = @"Friends";

ABViewControllerRootViewProperty(ABFriendsViewController, rootView, ABFriendsView)

@interface ABFriendsViewController () <ABArrayModelObserver, ABModelObserver>
@property (nonatomic ,strong)   ABUsersModel    *friends;

- (void)setupNavigationBar;

@end

@implementation ABFriendsViewController

#pragma mark -
#pragma mark Accessors

- (ABUsersModel *)friends {
    return self.model;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    self.context = [[ABFBGetFriendsContext alloc] initWithModel:self.model];
}

#pragma mark -
#pragma mark Overriden Methods

- (void)updateViewWithModel:(ABModel *)model {
    [self.rootView fillWithModel];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ABUserCell *cell = [tableView reusableCellWithClass:[ABUserCell class]];
    cell.user = self.friends[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ABFBUser *user = self.friends[indexPath.row];
    ABUserDetailViewController *userDetailViewController = [ABUserDetailViewController new];
    
    userDetailViewController.model = user;
    userDetailViewController.currentUser = self.currentUser;
    
    [self.navigationController pushViewController:userDetailViewController animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    self.navigationItem.title = ABNavigationBarTitle;
}

@end
