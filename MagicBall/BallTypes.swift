//
//  BallTypes.swift
//  MagicBall
//
//  Created by Rodrigo Machado on 8/20/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import SpriteKit


// enumerando as bolas
enum BallType: Int
{
    case unknown = 0, basket, eightBall, tennis
}

class BallTypes {
    
    var column: Int
    var row: Int
    var ballType: BallType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, ballType: BallType)
    {
        self.column = column
        self.row = row
        self.ballType = ballType
    }
    
//    var spriteName: String
//    {
//        let spriteNames = ["bas"
//        
//    }
}
