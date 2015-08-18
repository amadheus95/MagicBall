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
    var balls: SKSpriteNode?
    
    func getBallName(ballNumber: Int) -> String  // funcão para retornar o nome das bolas
    {
        switch(ballNumber)
        {
            case 1:
                return "8ball"
            case 2:
                return "tennis"
            case 3:
                return "basket"
            
            default:
                return "Nada"
        }
    }
    
    func background(ballNumber: Int) -> UIColor // retornar o fundo de cada bola
    {
        switch(ballNumber)
        {
        case 1:
            return UIColor.blueColor().eightBall
            
        default:
            return UIColor.greenColor()
        }
    }
}
