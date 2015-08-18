//
//  Random.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 18/08/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit

class Random{
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }

}