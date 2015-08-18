//
//  RespostasTennis.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 18/08/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit

class RespostasTennis {
    func getRespostas(value: Int) -> String{
        switch value{
        case 21:
            return "Ask for LoveGod, he is awesome"
        case 22:
            return "Do I Wanna Know?"
        default:
            let RespGenericas = RespostasGenericas()
            return RespGenericas.getResposta(value)
        }
    }
    
    func getNumeroMaximodeRespostas() -> Int{
        return 22
    }
}