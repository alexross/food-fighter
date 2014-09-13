//
//  FFGame.m
//  FoodFighter
//
//  Created by Alex Ross on 9/12/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import "FFGame.h"

@implementation FFGame

- (instancetype)initWithHero:(FFMob *)hero withEnemy:(FFMob *)enemy {
    self = [super init];
    
    if (self) {
        self.hero = hero;
        self.enemy = enemy;
    }
    
    return self;
}

- (BOOL)turnUntilGameOver:(MoveChoice)move {
    BOOL enemyAttack = false;
    
    // Randomize enemy selection
    NSInteger rand = arc4random() % 2;
    if (rand == 0) {
        enemyAttack = true;
    } else if (rand == 1) {
        enemyAttack = false;
    } else {
        NSLog(@"ERROR ERROR IN RANDOM ENEMY MOVE!!!!!");
    }
    
    if (enemyAttack && move == Attack) {
        // Both attack
        self.hero.currentHP = self.hero.currentHP - self.enemy.attack;
        self.enemy.currentHP = self.enemy.currentHP - self.hero.attack;
        self.lastMove = [NSString
                         stringWithFormat:@"💥 Both players attack! You take %d damage, while %@ takes %d.\n\n",
                         self.enemy.attack, self.enemy.name, self.hero.attack];
    } else if (enemyAttack && move == Defend) {
        // They attack, we defend
        self.hero.currentHP = self.hero.currentHP - (int)fmax(self.enemy.attack - self.hero.defense, 0);
        self.lastMove = [NSString
                         stringWithFormat:@"🔰 %@ attacks! You take %d damage, while %d was blocked.\n\n",
                         self.enemy.name, (int)fmax(self.enemy.attack - self.hero.defense, 0), self.hero.defense];
    } else if (!enemyAttack && move == Attack) {
        // They defend, we attack
        self.enemy.currentHP = self.enemy.currentHP - (int)fmax(self.hero.attack - self.enemy.defense, 0);
        self.lastMove = [NSString
                         stringWithFormat:@"👊 You attack! %@ takes %d damage, while %d was blocked.\n\n",
                         self.enemy.name, (int)fmax(self.hero.attack - self.enemy.defense, 0), self.enemy.defense];
    } else if (!enemyAttack && move == Defend) {
        // Both defend... nothing happens!
        self.lastMove = @"💤 Both of you defend, so nothing happens.\n\n";
    } else {
        NSLog(@"ERROR ERROR IN MOVE!!!!!");
    }
    
    if (self.enemy.currentHP <= 0) {
        self.lastMove = [NSString
                         stringWithFormat:@"🎉 You win! %@ was defeated!!\n\n",
                         self.enemy.name];
        return true; // gameOver = true;
    } else if (self.hero.currentHP <= 0) {
        self.lastMove = [NSString
                         stringWithFormat:@"😢 You have been defeated by %@...\n\n",
                         self.enemy.name];
        return true; // gameOver = true;
    } else {
        return false;
    }
}

@end
