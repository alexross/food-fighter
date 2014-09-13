//
//  FFGame.h
//  FoodFighter
//
//  Created by Alex Ross on 9/12/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFMob.h"
#include <math.h>

@interface FFGame : NSObject

typedef enum {
    Attack,
    Defend,
    //Flee
} MoveChoice;

- (instancetype)initWithHero:(FFMob *)hero withEnemy:(FFMob *)enemy;
- (BOOL)turnUntilGameOver:(MoveChoice)move;

@property (nonatomic) NSString *lastMove;

@property (nonatomic) FFMob *hero;
@property (nonatomic) FFMob *enemy;

@end
