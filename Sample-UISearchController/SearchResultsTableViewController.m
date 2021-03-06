//
//  SearchResultsTableViewController.m
//  Sample-UISearchController
//
//  Created by James Dempsey on 9/20/14.
//  Copyright (c) 2014 Tapas Software. All rights reserved.
//

#import "SearchResultsTableViewController.h"
#import "DetailViewController.h"
#import "Product.h"

@implementation SearchResultsTableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SearchResultCell" forIndexPath:indexPath];

    Product *product = [self.searchResults objectAtIndex:indexPath.row];

    cell.textLabel.text = product.name;

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Product *product = [self.searchResults objectAtIndex:indexPath.row];
    DetailViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"DetailViewController"];
    self.presentingViewController.navigationItem.title = @"Search";
    vc.product = product;
    [self.presentingViewController.navigationController pushViewController:vc animated:YES];
}


@end
