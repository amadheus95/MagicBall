//
//  NSObject_GameKitHelper.h
//  MagicBall
//
//  Created by Rodrigo Machado on 9/4/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GameKit;

@interface GameKitHelper: NSObject ()

@property (nonatomic, readonly) UIViewController *authentication;
@property (nonatomic, readonly) NSError *lastError;

+(instancetype)sharedGameKitHelper;

@end
