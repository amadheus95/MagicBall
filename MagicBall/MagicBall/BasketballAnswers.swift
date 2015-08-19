//
//  BasketballAnswers.swift
//  MagicBall
//
//  Created by Rodrigo Machado on 8/18/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit

class BasketballAnswers
{
    func getAnswers(value: Int) -> String // função para retornar perguntas relacionadas ao basquete
    {
        // fazendo uma escolha para as respostas
        switch value
        {
            case 21:
                return "Amazing crossover!"
            case 22:
                return "For the win!"
            default:
                let genericAnswers = RespostasGenericas()
                return genericAnswers.getResposta(value) // jogando um valor default 
        }
    }
    
    // retornando o número máximo de respostas
    func getMaximumAnswerNumbers() -> Int
    {
        return 22
    }
    
    
}
