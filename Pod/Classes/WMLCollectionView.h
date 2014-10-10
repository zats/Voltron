//
//  WMLCollectionView.h
//  ControllerCollectionView
//
//  Created by Sash Zats on 10/4/14.
//  Copyright (c) 2014 Wondermall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMLCollectionView;
@protocol WMLControllerCollectionViewDataSource <UICollectionViewDataSource>

@required
- (UIViewController *)controllerCollectionView:(WMLCollectionView *)collectionView
                       controllerForIdentifier:(NSString *)identifier;

@end


@class WMLCollectionViewCell;
@interface WMLCollectionView : UICollectionView

@property (nonatomic, weak) IBOutlet id<WMLControllerCollectionViewDataSource> dataSource;

@property (nonatomic, weak) IBOutlet UIViewController *containerViewController;

- (void)didEndDisplayingCell:(WMLCollectionViewCell *)cell;

@end
