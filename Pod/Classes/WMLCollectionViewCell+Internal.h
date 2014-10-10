//
//  WMLCollectionViewCell_Internal.h
//  ControllerCollectionView
//
//  Created by Sash Zats on 10/4/14.
//  Copyright (c) 2014 Wondermall. All rights reserved.
//

#import "WMLCollectionViewCell.h"

@protocol WMLCollectionViewCellDelegate;
@interface WMLCollectionViewCell ()

@property (nonatomic, weak) id<WMLCollectionViewCellDelegate> delegate;

@property (nonatomic, strong) id contentViewController;

@end
