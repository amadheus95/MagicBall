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
    
    func getBallName(ballNumber: Int) -> String { // funcão para retornar o nome das bolas
        switch(ballNumber) {
            case 1:
                return "8ball"
            case 2:
                return "tennis"
            case 3:
                return "basket"
            case 4:
                return "Pizzy"
            case 5:
                return "fogo1"
            case 6:
                return "laranjita"
            case 7:
                return "almondegados"
            case 8:
                return "boladecristal"
            case 9:
                return "bolinhodearroz"
            
            default:
                return "nada"
        }
    }
    
    func ballIsUnlocked(ballNumber: Int) -> Bool{
        //Aqui deveriamos pegar da merda do CoreData
        switch(ballNumber) {
        case 1:
            return true
        case 2:
            return true
        case 3:
            return true
        case 4:
            return true
        case 5:
            return false
        case 6:
            return true
        case 7:
            return true
        case 8:
            return true
        case 9:
            return true
        
        default:
            return false
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
    
    // função para retornar as respostas de cada classe
    func getResposta(value: Int, ballNumber: Int) -> String {
        switch ballNumber{
        case 1:
            let Resposta = Respostas8Ball()
            return Resposta.getRespostas(value)
        case 2:
            let Resposta = RespostasTennis()
            return Resposta.getRespostas(value)
        case 3:
            let answer = BasketballAnswers()
            return answer.getAnswers(value)
        case 3:
            let answer = BasketballAnswers()
            return answer.getAnswers(value)
        default:
            return "Deu merda"
        }
    }
    
    // função para retornar o número máximo de respostas de cada classe
    func getMaxRespostas(ballNumber: Int) -> Int {
        switch ballNumber{
        case 1:
            let Resposta = Respostas8Ball()
            return Resposta.getNumeroMaximodeRespostas()
        case 2:
            let Resposta = RespostasTennis()
            return Resposta.getNumeroMaximodeRespostas()
        case 3:
            let answer = BasketballAnswers()
            return answer.getMaximumAnswerNumbers()
        default:
            return 1
        }
    }
    
    func getTotalBalls() -> [String] {
        var names = [String]() // nome das bolas
        var i: Int
        
        // loop para pegar o nome de cada bola da magia
        for i = 1; self.getBallName(i) != "nada"; i++
        {
            names.append(self.getBallName(i))
            print(names[i - 1])
        }
        
        return names
    }
}
