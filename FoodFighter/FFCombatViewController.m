//
//  FFCombatViewController.m
//  FoodFighter
//
//  Created by Alex Ross on 9/8/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import "FFCombatViewController.h"

@implementation FFCombatViewController

- (FFGame *)game {
    if (!_game) _game = [[FFGame alloc]
                         initWithHero:[[FFMob alloc] initWithName:self.incomingName withAttack:3 withDefense:2 withVitality:5]
                         withEnemy:[[FFMob alloc] initWithName:@"Pepper Jack" withAttack:1 withDefense:3 withVitality:3]];
    return _game;
}

- (void)updateUI {
    // Update hp labels
    
    if (self.game.enemy.currentHP > 0.5 * 5 * self.game.hero.vitality &&
        self.game.hero.currentHP <= 0.75 * 5 * self.game.hero.vitality) {
        self.heroHPLabel.textColor = [UIColor colorWithRed:0.4 green:0.8 blue:0 alpha:1.0];
    } else if (self.game.enemy.currentHP > 0.25 * 5 * self.game.hero.vitality &&
               self.game.hero.currentHP <= 0.5 * 5 * self.game.hero.vitality) {
        self.heroHPLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0 alpha:1.0];
    } else if (self.game.hero.currentHP <= 0.25 * 5 * self.game.hero.vitality) {
        self.heroHPLabel.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
    }
    
    if (self.game.enemy.currentHP > 0.5 * 5 * self.game.enemy.vitality &&
        self.game.enemy.currentHP <= 0.75 * 5 * self.game.enemy.vitality) {
        self.enemyHPLabel.textColor = [UIColor colorWithRed:0.4 green:0.8 blue:0 alpha:1.0];
    } else if (self.game.enemy.currentHP > 0.25 * 5 * self.game.enemy.vitality &&
               self.game.enemy.currentHP <= 0.5 * 5 * self.game.enemy.vitality) {
        self.enemyHPLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0 alpha:1.0];
    } else if (self.game.enemy.currentHP <= 0.25 * 5 * self.game.enemy.vitality) {
        self.enemyHPLabel.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
    }
    
    self.heroHPLabel.text = [NSString stringWithFormat:@"%d/%d HP",
                             self.game.hero.currentHP,
                             self.game.hero.vitality * 5];
    self.enemyHPLabel.text = [NSString stringWithFormat:@"%d/%d HP",
                             self.game.enemy.currentHP,
                             self.game.enemy.vitality * 5];
    
    
    
    // Add to combat log
    self.combatLogTextView.text = [self.combatLogTextView.text stringByAppendingString:self.game.lastMove];
    [self.combatLogTextView scrollRangeToVisible:NSMakeRange([self.combatLogTextView.text length] - 1, 0)];
}

- (IBAction)touchAttackButton:(UIButton *)sender {
    self.isGameOver = [self.game turnUntilGameOver:Attack];
    [self updateUI];
    if (self.isGameOver) {
        _attackButton.enabled = NO;
        _defendButton.enabled = NO;
    }
}

- (IBAction)touchDefendButton:(UIButton *)sender {
    self.isGameOver = [self.game turnUntilGameOver:Defend];
    [self updateUI];
    if (self.isGameOver) {
        _attackButton.enabled = NO;
        _defendButton.enabled = NO;
    }
}

- (IBAction)combatTap:(UITapGestureRecognizer *)sender {
    if (self.isGameOver) {
        UIAlertView *gameOverAlert = [[UIAlertView alloc] initWithTitle:@"Game over" message:@"Your game has ended, so you are being returned to the title screen." delegate:self cancelButtonTitle:@"Go" otherButtonTitles:@"Wait", nil];
        [gameOverAlert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self performSegueWithIdentifier:@"segueToTitle" sender:self];
    }
    [alertView dismissWithClickedButtonIndex:1 animated:YES];
}

- (void)viewDidLoad {
    self.isGameOver = false;
    self.heroNameLabel.text = self.incomingName;
    self.combatLogTextView.text = [NSString stringWithFormat:@"❗️ Enemy '%@' has appeared!\n\n", self.game.enemy.name];
}
@end
