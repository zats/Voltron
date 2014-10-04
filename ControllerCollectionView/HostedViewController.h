//
//  HostedViewController.h
//  ControllerCollectionView
//
//  Created by Sash Zats on 10/4/14.
//  Copyright (c) 2014 Wondermall. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HostedViewControllerType) {
    HostedViewControllerTypeMail,
    HostedViewControllerTypePhoto
};

@interface HostedViewController : UIViewController

@property (nonatomic, assign) HostedViewControllerType type;

@end
