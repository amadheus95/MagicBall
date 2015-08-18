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
    var balls = SKSpriteNode()
    
    func getBallName(ballNumber: Int) -> String // funcão para retornar o nome das bolas
    {
        switch(ballNumber)
        {
            case 1:
                return "8ball"
            
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
    
    func createBalls(ballNumber: Int) -> SKSpriteNode // função para criar as bolas
    {
        balls = SKSpriteNode(imageNamed: getBallName(ballNumber)) // chama a função do nome das bolas
        balls.xScale = 1
        balls.yScale = 1
        balls.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        balls.name = getBallName(ballNumber)
        
        return balls

    }
    
}
