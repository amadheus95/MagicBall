//
//  Balls.swift
//  MagicBall
//
//  Created by Rodrigo Machado on 8/18/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Balls: SKSpriteNode
{
    var imageBalls = SKNode()
    
    func getBallName(ballNumber: Int) -> String
    {
        switch(ballNumber)
        {
            case 1:
                return "8"
            
            default:
                return "Nada"
        }
    }
    
}
