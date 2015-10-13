//
//  RespostasGenericas.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 18/08/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit

class RespostasGenericas {
    func getResposta(value: Int) -> String{
        switch value{
        case 1:
            return "It is certain"
        case 2:
            return "It is decidedly so"
        case 3:
            return "Without a doubt"
        case 4:
            return "Yes definitely"
        case 5:
            return "You may rely on it"
        case 6:
            return "As I see it, yes"
        case 7:
            return "Most likely"
        case 8:
            return "Outlook good"
        case 9:
            return "Yes"
        case 10:
            return "Signs point to yes"
        case 11:
            return "Reply hazy try again"
        case 12:
            return "Ask again later"
        case 13:
            return "Better not tell you now"
        case 14:
            return "Cannot predict now"
        case 15:
            return "Concentrate and ask again"
        case 16:
            return "Don't count on it"
        case 17:
            return "My reply is no"
        case 18:
            return "My sources say no"
        case 19:
            return "Outlook not so good"
        case 20:
            return "Very doubtful"
        default:
            return "Accept, is better"
        }
    }
}
