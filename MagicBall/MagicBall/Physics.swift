//
//  Physics.swift
//  MagicBall
//
//  Created by leonardo fernandes farias on 20/08/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Physics {
    func getAnswerBox(ballNumber: Int, withSize: CGFloat) -> SKPhysicsBody {
        var physics = SKPhysicsBody(circleOfRadius: withSize)
        physics.dynamic = true
        
        return physics
    }
    
    func getGlass(ballNumber: Int, withSize: CGFloat) -> SKPhysicsBody {
        var physics = SKPhysicsBody(circleOfRadius: withSize)
        physics.dynamic = false
        return physics
    }
}
