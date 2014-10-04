//
//  WMLControllerCollectionView.m
//  ControllerCollectionView
//
//  Created by Sash Zats on 10/4/14.
//  Copyright (c) 2014 Wondermall. All rights reserved.
//

#import "WMLControllerCollectionView.h"

#import "WMLCollectionViewCell.h"
#import "WMLCollectionViewCell+Internal.h"
#import "WMLCollectionViewCellDelegate.h"

@interface WMLControllerCollectionView () <WMLCollectionViewCellDelegate>

@end

@implementation WMLControllerCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier
                                forIndexPath:(NSIndexPath *)indexPath {
    WMLCollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier
                                               forIndexPath:indexPath];
    if (![cell isKindOfClass:[WMLCollectionViewCell class]]) {
        return cell;
    }
    cell.contentView.backgroundColor = [UIColor grayColor];
    cell.delegate = self;
    if (!cell.contentViewController) {
        UIViewController *controller = [self.dataSource controllerCollectionView:self
                                                         controllerForIdentifier:identifier];
        NSAssert(controller && [controller isKindOfClass:[UIViewController class]], @"The collection view's data source did not return a valid view controller for identifier %@", identifier);
        cell.contentViewController = controller;
    }
    return cell;
}

#pragma mark - Public

- (void)didEndDisplayingCell:(WMLCollectionViewCell *)cell {
    UIViewController *controller = cell.contentViewController;
    [self _unhostViewController:controller];
}

#pragma mark - Private

- (void)_unhostViewController:(UIViewController *)controller {
    [controller willMoveToParentViewController:nil];
    [controller.view removeFromSuperview];
    [controller removeFromParentViewController];
}

- (void)_hostViewController:(UIViewController *)controller
               withHostView:(UIView *)superview {
    [self.containerViewController addChildViewController:controller];
    controller.view.frame = superview.bounds;
    controller.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [superview addSubview:controller.view];
    [controller didMoveToParentViewController:self.containerViewController];
}

#pragma mark - WMLCollectionViewCellDelegate

- (void)collectionViewCell:(WMLCollectionViewCell *)cell willMoveToWindow:(UIWindow *)window {
    DLog(@"cell %p", cell);
    [self _hostViewController:cell.contentViewController
                withHostView:cell.contentView];
}

- (void)collectionViewCellWillPrepareForReuse:(WMLCollectionViewCell *)cell {
    DLog(@"cell %p", cell);
    [self _hostViewController:cell.contentViewController
                withHostView:cell.contentView];
}

@end
