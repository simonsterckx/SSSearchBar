//
//  SSSearchBar.h

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

#import <UIKit/UIKit.h>

@protocol SSSearchBarDelegate;

//A clean, easy to use, awesome replacement for UISearchBar.
@interface SSSearchBar : UIView

//Wrappers around the Textfield subview
@property (nonatomic) NSString *text;
@property (nonatomic) UIFont *font;
@property (nonatomic) NSString *placeholder;

//The text field subview
@property (nonatomic) UITextField *textField;

@property (nonatomic, getter = isCancelButtonHidden) BOOL cancelButtonHidden; //NO by Default

@property (nonatomic, weak) id <SSSearchBarDelegate> delegate;

@end

@protocol SSSearchBarDelegate <NSObject>

@optional
- (void)searchBarCancelButtonClicked:(SSSearchBar *)searchBar;
- (void)searchBarSearchButtonClicked:(SSSearchBar *)searchBar;

- (BOOL)searchBarShouldBeginEditing:(SSSearchBar *)searchBar;
- (void)searchBarTextDidBeginEditing:(SSSearchBar *)searchBar;
- (void)searchBarTextDidEndEditing:(SSSearchBar *)searchBar;

- (void)searchBar:(SSSearchBar *)searchBar textDidChange:(NSString *)searchText;
@end

//A rounded view that makes up the background of the search bar.
@interface SSRoundedView : UIView
@end
