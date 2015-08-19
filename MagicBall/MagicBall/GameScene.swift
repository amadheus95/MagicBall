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
    var text: Bool?
    
    var labelAnswers: SKLabelNode?
    var balls: SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        text = false
        self.createBall()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
    
    func createBall() {
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
        if text == false{
            self.createText()
            text = true
            addChild(labelAnswers!)
        }
        let Ball = Balls()
        let MaxRespostas = Ball.getMaxRespostas(1)
        
        let ramdomInstance = Random()
        let randomNumber = ramdomInstance.randomInt(1, max: MaxRespostas)
        
        labelAnswers?.text = Ball.getResposta(randomNumber, ballNumber: 1)
        print(labelAnswers!.text)
        
    }
    
    func removeText(){
        removeChildrenInArray([labelAnswers!])
    }
    
    func createText(){
        labelAnswers =  SKLabelNode()
        //RespostaLabel?.fontName = "Futura-Medium"
        labelAnswers?.fontSize = 20;
        labelAnswers?.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        labelAnswers?.fontColor = SKColor.whiteColor();
        labelAnswers?.name = "Texto";
        labelAnswers?.zPosition = 100;
        
        //addChild(RespostaLabel!)
    }
    
}
