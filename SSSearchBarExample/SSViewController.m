//
//  SSViewController.m
//
/*
 Copyright (c) 2014 Simon Gislen
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "SSViewController.h"
#import "SSSearchBar.h"

@interface SSViewController () <SSSearchBarDelegate>

@property (weak, nonatomic) IBOutlet SSSearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *data;
@property (nonatomic) NSArray *searchData;

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.searchBar.cancelButtonHidden = NO;
    self.searchBar.placeholder = NSLocalizedString(@"Search text here!", nil);
    self.searchBar.delegate = self;
    [self.searchBar becomeFirstResponder];
    
    self.data = @[ @"Hey there!", @"This is a custom UISearchBar.", @"And it's really easy to use...", @"Sweet!" ];
    self.searchData = self.data;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - SSSearchBarDelegate

- (void)searchBarCancelButtonClicked:(SSSearchBar *)searchBar {
    self.searchBar.text = @"";
    [self filterTableViewWithText:self.searchBar.text];
}
- (void)searchBarSearchButtonClicked:(SSSearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}
- (void)searchBar:(SSSearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self filterTableViewWithText:searchText];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchData count];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    [self customiseTableViewCell:cell atIndexPath:indexPath];
    
    cell.textLabel.text = self.searchData[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:14];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Helper Methods

- (void)filterTableViewWithText:(NSString *)searchText {
    if ([searchText isEqualToString:@""]) {
        self.searchData = self.data;
    }
    else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self CONTAINS[cd] %@", searchText];
        self.searchData = [self.data filteredArrayUsingPredicate:predicate];
    }
    
    [self.tableView reloadData];
}

- (void)customiseTableViewCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    //Some fancy stuff - This really isn't needed and isn't the best way to do it. Subclass UITableViewCell if you want something like this.
    UIView *backgroundColorView = [cell.contentView viewWithTag:10];
    
    CGRect backgroundFrame = CGRectMake(2, 2, cell.bounds.size.width - 4, cell.bounds.size.height - 2 - (indexPath.row == self.searchData.count - 1? 2:0));
    
    if (!backgroundColorView) {
        backgroundColorView = [[UIView alloc] initWithFrame:backgroundFrame];
        backgroundColorView.tag = 10;
        backgroundColorView.backgroundColor = self.view.backgroundColor;
        [cell.contentView insertSubview:backgroundColorView atIndex:0];
        cell.textLabel.backgroundColor = [UIColor clearColor];
    }
    else {
        backgroundColorView.frame = backgroundFrame;
    }
    
}
@end
