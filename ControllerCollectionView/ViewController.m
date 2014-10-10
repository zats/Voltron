//
//  ViewController.m
//  ControllerCollectionView
//
//  Created by Sash Zats on 10/4/14.
//  Copyright (c) 2014 Wondermall. All rights reserved.
//

#import "ViewController.h"

#import "HostedViewController.h"

#import "WMLControllerCollectionView.h"
#import "WMLCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, WMLControllerCollectionViewDataSource>
@property (weak, nonatomic) IBOutlet WMLControllerCollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - Private

- (void)_configureController:(UIViewController *)controller
          forItemAtIndexPath:(NSIndexPath *)indexPath {
    controller.view.backgroundColor = indexPath.item % 2 ? [UIColor blueColor] : [UIColor redColor];
    ((HostedViewController *)controller).type = indexPath.item % 2 ? HostedViewControllerTypeMail : HostedViewControllerTypePhoto;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = indexPath.item % 2 ? @"Cell1" : @"Cell2";
    WMLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                        forIndexPath:indexPath];
    [self _configureController:cell.contentViewController
            forItemAtIndexPath:indexPath];
    return cell;
}

#pragma mark - WMLControllerCollectionViewDataSource 

- (UIViewController *)controllerCollectionView:(WMLControllerCollectionView *)collectionView
                       controllerForIdentifier:(NSString *)identifier {
    return [self.storyboard instantiateViewControllerWithIdentifier:@"HostedViewController"];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(WMLControllerCollectionView *)collectionView
  didEndDisplayingCell:(WMLCollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView didEndDisplayingCell:cell];
}

@end
