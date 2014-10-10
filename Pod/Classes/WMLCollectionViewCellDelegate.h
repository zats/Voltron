//
//  WMLCollectionViewCellDelegate.h
//  ControllerCollectionView
//
//  Created by Sash Zats on 10/4/14.
//  Copyright (c) 2014 Wondermall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WMLCollectionViewCell;
@protocol WMLCollectionViewCellDelegate <NSObject>

- (void)collectionViewCellWillPrepareForReuse:(WMLCollectionViewCell *)cell;

- (void)collectionViewCell:(WMLCollectionViewCell *)cell
          willMoveToWindow:(UIWindow *)window;

@end
