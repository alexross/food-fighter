//
//  FFMob.h
//  FoodFighter
//
//  Created by Alex Ross on 9/12/14.
//  Copyright (c) 2014 Alex Ross. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFMob : NSObject

- (instancetype)initWithName:(NSString *)name
                  withAttack:(NSInteger)attack
                 withDefense:(NSInteger)defense
                withVitality:(NSInteger)vitality;

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger attack;
@property (nonatomic) NSInteger defense;
@property (nonatomic) NSInteger vitality;
@property (nonatomic) NSInteger currentHP;

@end
