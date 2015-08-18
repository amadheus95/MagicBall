//
//  GameScene.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 17/08/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import SpriteKit
import UIKit

@IBDesignable

class GameScene: SKScene
{
    //4dc4ff
    
//    var triangulo:    SKLabelNode?
//    var triangulofFx: SKLabelNode?
    
    var RespostaLabel: SKLabelNode?
    var bolinha: SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        self.criarBolinha()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
    
    func criarBolinha() {
        let ball = Balls()
        bolinha = ball.balls(1)
        addChild(bolinha!)
    }
    
    func mostrarTexto() {
        //COLOCAR O TEXTO AQUI!
        self.criarTexto()
        RespostaLabel?.text = "Não bro"
        addChild(RespostaLabel!)
    }
    
    func retiraTexto(){
        removeChildrenInArray([RespostaLabel!])
    }
    
    func criarTexto(){
        RespostaLabel =  SKLabelNode()
        //RespostaLabel?.fontName = "Futura-Medium"
        RespostaLabel?.fontSize = 20;
        RespostaLabel?.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        RespostaLabel?.fontColor = SKColor.blackColor();
        RespostaLabel?.name = "Texto";
        RespostaLabel?.zPosition = 100;
        
        //addChild(RespostaLabel!)
    }
    
}
