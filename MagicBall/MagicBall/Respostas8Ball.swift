//
//  Respostas8Ball.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 18/08/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit

class Respostas8Ball {
    func getRespostas(value: Int) -> String{
        switch value{
        case 21:
            return "Love the LoveGod"
        case 22:
            return "Live is a Circus"
        default:
            let RespGenericas = RespostasGenericas()
            return RespGenericas.getResposta(value)
        }
    }
    
    func getNumeroMaximodeRespostas() -> Int{
        return 22
    }
}