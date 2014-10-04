//
//  HostedViewController.m
//  ControllerCollectionView
//
//  Created by Sash Zats on 10/4/14.
//  Copyright (c) 2014 Wondermall. All rights reserved.
//

#import "HostedViewController.h"

@import MessageUI;

@interface HostedViewController () <MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, weak) UIViewController *currentViewController;

@end

@implementation HostedViewController

#pragma mark - Actions

- (void)_pickPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.modalPresentationStyle = UIModalPresentationCurrentContext;
    picker.delegate = self;
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
    self.currentViewController = picker;
}

- (void)_sendMail {
    if (![MFMailComposeViewController canSendMail]) {
        [[[UIAlertView alloc] initWithTitle:@"Can't send mail"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    composer.modalPresentationStyle = UIModalPresentationCurrentContext;
    composer.mailComposeDelegate = self;
    [self presentViewController:composer
                       animated:YES
                     completion:nil];
    self.currentViewController = composer;
}

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.type == HostedViewControllerTypeMail) {
        [self.button addTarget:self
                        action:@selector(_sendMail)
              forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitle:@"Send Mail" forState:UIControlStateNormal];
    } else {
        [self.button addTarget:self
                        action:@selector(_pickPhoto)
              forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitle:@"Pick Photo" forState:UIControlStateNormal];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.button removeTarget:nil
                       action:nil
             forControlEvents:UIControlEventAllEvents];
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    if (!parent) {
        [self.currentViewController dismissViewControllerAnimated:NO
                                                       completion:nil];        
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    NSAssert(self.currentViewController == controller, @"Current controller should be %@", controller);
    [controller dismissViewControllerAnimated:YES
                                   completion:nil];
    self.currentViewController = nil;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSAssert(self.currentViewController == picker, @"Current controller should be %@", picker);
    [picker dismissViewControllerAnimated:YES
                               completion:nil];
    self.currentViewController = nil;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSAssert(self.currentViewController == picker, @"Current controller should be %@", picker);
    [picker dismissViewControllerAnimated:YES
                               completion:nil];
    self.currentViewController = nil;
}

@end
