//
//  FFMob.m
//  FoodFighter
//
//  Created by Alex Ross on 9/12/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import "FFMob.h"

@implementation FFMob

- (instancetype)initWithName:(NSString *)name
                  withAttack:(NSInteger)attack
                 withDefense:(NSInteger)defense
                withVitality:(NSInteger)vitality {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.attack = attack;
        self.defense = defense;
        self.vitality = vitality;
        self.currentHP = vitality * 5;
    }
    return self;
}

@end
