//
//  Glass.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 19/08/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Glass: SKSpriteNode {
    func getGlassName(ballNumber: Int) -> String{
        switch(ballNumber) {
        case 1,2,3:
            return "furo"
        default:
            print("Deu merda na Classe Glass com o nome do Vidro")
            return "furo"
        }
    }
    
    func getColiderForm(ballNumber: Int){
        switch (ballNumber) {
        case 1,2,3:
            
            
            return
        default:
            print("Erro na classe Glass com colider")
            return
        }
    }
    
    func getTriangleName(ballNumber: Int) -> String{ //Funcao para pegar a imagem do tringulo da resposta
        switch (ballNumber){                        //********ATENCAO******
        case 1,2,3:                                 //Essa funcao vai servir pra pegar o efeito tbm...
            return "triangle"                      //adicionando um "fx" depois do nome
        default:
            print("deu merda na classe Glass com o nome do triangulo")
            return "triangle"
        }
    }
}