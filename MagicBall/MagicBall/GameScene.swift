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
    var TextoCriado: Bool?
    
    var RespostaLabel: SKLabelNode?
    var balls: SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        TextoCriado = false
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
        
        balls = SKSpriteNode(imageNamed: ball.getBallName(1)) // chama a função do nome das bolas
        balls!.xScale = 1
        balls!.yScale = 1
        balls!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        balls!.name = ball.getBallName(1)
        
        backgroundColor = ball.background(1)
        
        addChild(balls!) // adicionando o objeto a cena
    }
    
    func mostrarTexto() {
        //COLOCAR O TEXTO AQUI!
        if TextoCriado == false{
            self.criarTexto()
            TextoCriado = true
            addChild(RespostaLabel!)
        }
        let Ball = Balls()
        let MaxRespostas = Ball.getMaxRespostas(1)
        
        let RamdomInstance = Random()
        let NumeroAleatorio = RamdomInstance.randomInt(1, max: MaxRespostas)
        
        RespostaLabel?.text = Ball.getResposta(NumeroAleatorio, ballNumber: 1)
        print(RespostaLabel!.text)
        
    }
    
    func retiraTexto(){
        removeChildrenInArray([RespostaLabel!])
    }
    
    func criarTexto(){
        RespostaLabel =  SKLabelNode()
        //RespostaLabel?.fontName = "Futura-Medium"
        RespostaLabel?.fontSize = 20;
        RespostaLabel?.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        RespostaLabel?.fontColor = SKColor.whiteColor();
        RespostaLabel?.name = "Texto";
        RespostaLabel?.zPosition = 100;
        
        //addChild(RespostaLabel!)
    }
    
}
