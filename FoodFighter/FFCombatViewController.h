//
//  FFCombatViewController.h
//  FoodFighter
//
//  Created by Alex Ross on 9/8/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFGame.h"

@interface FFCombatViewController : UIViewController

@property (nonatomic, strong) FFGame *game;
@property (weak, nonatomic) IBOutlet UILabel *heroHPLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyHPLabel;
@property (weak, nonatomic) IBOutlet UILabel *heroNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *combatLogTextView;

@property (nonatomic) NSString *incomingName;
@property (nonatomic) BOOL isGameOver;
@property (weak, nonatomic) IBOutlet UIButton *attackButton;
@property (weak, nonatomic) IBOutlet UIButton *defendButton;

@end
