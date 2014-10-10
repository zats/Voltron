# Voltron

![Illustration](https://raw.github.com/zats/Voltron/master/Illustration-1@2x.png)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Simply implement an additional data source method:

```objective-c
- (UIViewController *)controllerCollectionView:(WMLControllerCollectionView *)collectionView controllerForIdentifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"Login"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    } else if ([identifier isEqualToString:@"Profile"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    }
}
```

The method is called only when a new view controller being created.

You can use regular cells along side with view controller container cells.


## Requirements

## Installation

Voltron is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "Voltron"

## Author

Sash Zats, sash@zats.io

## License

Voltron is available under the MIT license. See the LICENSE file for more info.

:cow::dog: Moof!
