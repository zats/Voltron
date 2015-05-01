# Voltron

`UICollectionView` with `UIViewController`s instead of cells.

![Illustration](https://raw.github.com/zats/Voltron/master/Illustration-1@2x.png)

View controller containment compliant!

## Installation

Voltron is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "Voltron", '~> x.x.x'

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

* `#import <Voltron/Voltron.h>`

* Use `WMLCollectionView` instead of `UICollectionView` and `WMLCollectionViewCell` for cells, displaying view controllers.

* Set the `collectionView.containerViewController` to the view controller that is hosting children view controllers.

* Implement a data source method:
```objective-c
- (UIViewController *)collectionView:(WMLCollectionView *)collectionView controllerForIdentifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"Login"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    } else if ([identifier isEqualToString:@"Profile"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    }
}
```

* Once done displaying cell, call `didEndDisplayingCell:` passing the cell to give the collection view a clue that it can be recycled.

```objective-c
- (void)collectionView:(WMLCollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView didEndDisplayingCell:cell];
}
```

## FAQ

### Can `WMLCollectionView` host the regular cells along with view controller-based cells?

Yes.

### How often is the `collectionView:controllerForIdentifier:` being called?

The data source method is called only when a new view controller is created, when possible, view controllers are being reused just like regular cells.

### Is it a good place to configure my view controller with data?

It's definitely not. Only one time initialisation, and that is better to be done in `viewDidLoad` of the loaded view controller.

To configure your view controller with data, use `-[WMLCollectionViewCell contentViewController]`

### What about the view controller lifecycle?

The lifecycle of the view controller is preserved. When the view controller is about to be displayed, `viewWillAppear:` and `viewDidAppear:` are triggered.

Once the view controller goes away from the screen, `viewWillDisappear:` and `viewDidDisappear:` are triggered.

### Performance?

You should keep in mind that in performance critical areas might suffer when you're trying to display too many cells simultaneously.

Be wise about the moment of filling the collection view with data. E.g. it's probably better to defer displaying 200 small cells while playing an opening transition.

For smooth scrolling try to defer the population of the controller with data.

In that sense, test project is intended just as a showcase of how to use the API, but it's obviously not a typical use case from performance point of view.

### Why all the hassle with `collectionView:didEndDisplayingCell:forItemAtIndexPath:`?

This project is intended as App Store-compliant, therefore I wanted to implement it using the public API only.

### Why not to use `collectionView:willDisplayCell:forItemAtIndexPath:` then?

Project is intended to be iOS 7 compatible. Sadly, delegate method above is iOS 8+. Also, that's why you have to use a custom `WMLCollectionViewCell`. To notify collection view that it's about to be shown.

### Why "Voltron"?

I really don't know, meanwhile, an unrelated picture.
[![Illustration](https://raw.github.com/zats/Voltron/master/Votron.jpg)](http://en.wikipedia.org/wiki/Voltron)

## License

Voltron is available under the MIT license. See the LICENSE file for more info.

## Author

Sash Zats, sash@zats.io

:cow::dog: Moof!
