//
//  GameScene.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 17/08/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import SpriteKit
import UIKit
import Foundation

class GameScene: SKScene
{
    var index       : Int?
    var text        : Bool?
    var answerBox   : SKSpriteNode?
    var answerBoxFx : SKSpriteNode?
    var labelAnswers: SKLabelNode?
    var glass       : SKSpriteNode?
    var balls       : SKSpriteNode?
    //borda
    
    var ballsButton : SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        text = false
        self.createBall()
        self.createGlass()
        
        let x = Balls()
        x.getTotalBalls()
        
        self.createTriangle()
        
        print(index!)
        
    }
    
    func createBall() {
        let ball = Balls()
        
        balls = SKSpriteNode(imageNamed: ball.getBallName(index!)) // chama a função do nome das bolas=
        balls!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        balls!.name = ball.getBallName(index!)
        balls!.zPosition = 90
        
        backgroundColor = ball.background(1)
        
        addChild(balls!) // adicionando o objeto a cena
    }
    
    //Mexer só aqui!
    func createGlass(){
        let glassInstance = Glass()
        
        glass = SKSpriteNode(imageNamed: glassInstance.getGlassName(1))
        glass!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-40);
        glass!.name = glassInstance.getGlassName(1)
        glass!.zPosition = 97
        
        let physic = Physics()
        glass!.physicsBody = physic.getGlass(1, withSize: glass!.frame.height)
        addChild(glass!)
    }
    
    func mostrarTexto() {
        //COLOCAR O TEXTO AQUI!
        if text == false{
            self.createText()
            text = true
            addChild(labelAnswers!)
        }
        let Ball = Balls()
        let MaxRespostas = Ball.getMaxRespostas(index!)
        
        let ramdomInstance = Random()
        let randomNumber = ramdomInstance.randomInt(1, max: MaxRespostas)
        
        labelAnswers?.text = Ball.getResposta(randomNumber, ballNumber: index!)
        print(labelAnswers!.text)
        
    }
    
    func removeText(){
        removeChildrenInArray([labelAnswers!])
    }
    
    func createTriangle(){
        let boxInstance = Glass()
        
        answerBox = SKSpriteNode(imageNamed: boxInstance.getTriangleName(1))
        answerBox!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-40);
        answerBox!.name = boxInstance.getTriangleName(1)
        answerBox!.zPosition = 99
        
        let physic = Physics()
        answerBox!.physicsBody = physic.getAnswerBox(1,withSize: answerBox!.frame.height)
        
        addChild(answerBox!)
        
        
        answerBoxFx = SKSpriteNode(imageNamed: boxInstance.getTriangleName(1)+"fx")
        answerBoxFx!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-40);
        answerBoxFx!.name = boxInstance.getTriangleName(1) + "fx"
        answerBoxFx!.zPosition = 98
        
        addChild(answerBoxFx!)
        
    }
    
    func createText(){
        labelAnswers =  SKLabelNode()
        labelAnswers?.fontName = "Helvetica"
        labelAnswers?.fontSize = 17;
        labelAnswers?.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-40);
        labelAnswers?.fontColor = SKColor.whiteColor();
        labelAnswers?.name = "Texto";
        labelAnswers?.zPosition = 100;
    }
    
    func points()
    {
        ballsButton = SKSpriteNode(imageNamed: "fogo1")
        ballsButton!.position = CGPoint(x: CGRectGetMidX(frame) * 1.45, y: CGRectGetMaxY(frame) - ballsButton!.frame.height + 5)
        ballsButton!.name = "points"
        ballsButton!.zPosition = 908
    }
    
}
