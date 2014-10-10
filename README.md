# Voltron

![Illustration](https://raw.github.com/zats/Voltron/master/Illustration-1@2x.png)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### 1. Use `WMLCollectionView` and `WMLCollectionViewCell`

### 2. Implement a data source method

```objective-c
- (UIViewController *)controllerCollectionView:(WMLCollectionView *)collectionView controllerForIdentifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"Login"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    } else if ([identifier isEqualToString:@"Profile"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    }
}
```

*<small>The method is called only when a new view controller being created.</small>*

### 3. Profit!

And yes, you can use regular cells along side with view controller container cells.

## With great power…

You should keep in mind that

## Installation

Voltron is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "Voltron"

## License

Voltron is available under the MIT license. See the LICENSE file for more info.

## Author

Sash Zats, sash@zats.io

:cow::dog: Moof!

## Why "Voltron"?

This guy!

![Illustration](https://raw.github.com/zats/Voltron/master/Votron.png)
