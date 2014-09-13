//
//  FFInfoViewController.m
//  FoodFighter
//
//  Created by Alex Ross on 9/9/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import "FFInfoViewController.h"

@implementation FFInfoViewController
- (IBAction)closeInfo:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [self.referencesTextView scrollRangeToVisible:NSMakeRange(0, 0)];
}
@end
