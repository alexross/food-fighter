//
//  FFViewController.m
//  FoodFighter
//
//  Created by Alex Ross on 9/4/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import "FFViewController.h"
#import "FFCombatViewController.h"

@interface FFViewController ()
@property (weak, nonatomic) IBOutlet UITextField *heroName;

@end

@implementation FFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.heroName.delegate = self;
    //[self performSegueWithIdentifier:@"showCombat" sender:self];
}

- (IBAction)touchStartButton:(UIButton *)sender {
    if ([self.heroName.text length] == 0) {
        UIAlertView *noNameAlert = [[UIAlertView alloc] initWithTitle:@"Name error" message:@"Your hero needs a name to play!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [noNameAlert show];
    } else {
        [self performSegueWithIdentifier:@"segueToCombat" sender:self];
    }
}

// It is absolutely absurd that you have to do this to make the keyboard disappear
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToCombat"]) {
        FFCombatViewController *controller = (FFCombatViewController *)segue.destinationViewController;
        controller.incomingName = self.heroName.text;
    }
}

@end
