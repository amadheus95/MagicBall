//
//  NSObject+GameKitHelper.m
//  MagicBall
//
//  Created by Rodrigo Machado on 9/4/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

#import "GameKitHelper.h"

@implementation NSObject (GameKitHelper)

+ (instancetype)sharedGameKitHelper
{
    static GameKitHelper *sharedGameKitHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGameKitHelper = [[GameKitHelper alloc] init];
    });
    return sharedGameKitHelper;
}

@end
