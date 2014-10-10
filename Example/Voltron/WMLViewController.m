//
//  WMLViewController.m
//  Voltron
//
//  Created by Sash Zats on 10/10/2014.
//  Copyright (c) 2014 Sash Zats. All rights reserved.
//

#import "WMLViewController.h"

#import <Voltron/Voltron.h>

static NSArray *WMLColors;

@interface WMLViewController () <UICollectionViewDelegate, UICollectionViewDataSource, WMLControllerCollectionViewDataSource>
@property (nonatomic, weak) IBOutlet WMLControllerCollectionView *collectionView;
@property (nonatomic) NSUInteger depth;
@end

@implementation WMLViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        WMLColors = @[
            [UIColor colorWithRed:0.812 green:0.941 blue:0.620 alpha:1.000],
            [UIColor colorWithRed:0.659 green:0.859 blue:0.659 alpha:1.000],
            [UIColor colorWithRed:0.475 green:0.741 blue:0.604 alpha:1.000],
            [UIColor colorWithRed:0.231 green:0.525 blue:0.525 alpha:1.000],
            [UIColor colorWithRed:0.043 green:0.282 blue:0.420 alpha:1.000]
        ];
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%p Depth: %tu", self, self.depth);
    self.view.backgroundColor = WMLColors[self.depth];
    self.collectionView.backgroundColor = WMLColors[self.depth];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat itemSize = floor((CGRectGetWidth(self.view.bounds) - 5 * 3) / 2);
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(itemSize, itemSize);
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.depth < 2 ? 4 : 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WMLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                            forIndexPath:indexPath];
    WMLViewController *viewController = cell.contentViewController;
    viewController.depth = self.depth + 1;
    return cell;
}

#pragma mark - UICollectionViewDataSource

#pragma mark - WMLControllerCollectionViewDataSource

- (UIViewController *)controllerCollectionView:(WMLControllerCollectionView *)collectionView
                       controllerForIdentifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"Cell"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    }
    NSAssert(NO, @"Didn't expect to get an identifier %@", identifier);
    return nil;
}

@end
