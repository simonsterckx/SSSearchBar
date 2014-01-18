#SSSearchBar

A clean, easy to use, awesome replacement for UISearchBar.

<img src="https://dl.dropboxusercontent.com/u/26632507/git/SSSearchBar-Image.png" width="50%" height="50%"/>

##How to use

Download the code and add the files under SSSearchBar/* to your project.

Drag a UIView into your xib/storyboard and set the class to `SSSearchBar`. Alternatively, use `-initWithFrame:` in your view code.

SSSearchBar supports the following delegate methods. `-searchBar:textDidChange:` is probably where you want to implement the searching.

````Objective-C
- (void)searchBarCancelButtonClicked:(SSSearchBar *)searchBar;
- (void)searchBarSearchButtonClicked:(SSSearchBar *)searchBar;

- (BOOL)searchBarShouldBeginEditing:(SSSearchBar *)searchBar;
- (void)searchBarTextDidBeginEditing:(SSSearchBar *)searchBar;
- (void)searchBarTextDidEndEditing:(SSSearchBar *)searchBar;

- (void)searchBar:(SSSearchBar *)searchBar textDidChange:(NSString *)searchText;

````


##Licence 
This project is under the MIT Licence.
Feel free to fork :)
