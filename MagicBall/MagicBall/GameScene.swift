//
//  GameScene.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 17/08/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene
{
    var text        : Bool?
    var answerBox   : SKSpriteNode?
    var answerBoxFx : SKSpriteNode?
    var labelAnswers: SKLabelNode?
    var glass       : SKSpriteNode?
    var balls       : SKSpriteNode?
    
    var ballsButton : SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        text = false
        self.createBall()
        self.createGlass()
        self.createButton()
        //self.createTriangle()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var touch = UITouch()
        touch = touches.first!
        var location = CGPoint()
        location = touch.locationInNode(self)
        var node = SKNode()
        node = nodeAtPoint(location)
        
        if (node.name == "ballsButton"){
            let scene = ChooseBall()
            // Configure the view.
            let skView = view
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView!.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView!.presentScene(scene)
        }
        
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
    
    func createBall() {
        let ball = Balls()
        
        balls = SKSpriteNode(imageNamed: ball.getBallName(1)) // chama a função do nome das bolas=
        balls!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        balls!.name = ball.getBallName(1)
        balls!.zPosition = 90
        
        backgroundColor = ball.background(1)
        
        addChild(balls!) // adicionando o objeto a cena
    }
    
    func createGlass(){
        let glassInstance = Glass()
        
        glass = SKSpriteNode(imageNamed: glassInstance.getGlassName(1))
        glass!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        glass!.name = glassInstance.getGlassName(1)
        glass!.zPosition = 97
        
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
        let MaxRespostas = Ball.getMaxRespostas(1)
        
        let ramdomInstance = Random()
        let randomNumber = ramdomInstance.randomInt(1, max: MaxRespostas)
        
        labelAnswers?.text = Ball.getResposta(randomNumber, ballNumber: 1)
        print(labelAnswers!.text)
        
    }
    
    func removeText(){
        removeChildrenInArray([labelAnswers!])
    }
    
    func createTriangle(){
        let boxInstance = Glass()
        
        answerBox = SKSpriteNode(imageNamed: boxInstance.getTriangleName(1))
        answerBox!.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        answerBox!.name = boxInstance.getTriangleName(1)
        answerBox!.zPosition = 99
        
        addChild(answerBox!)
        
        
        answerBoxFx = SKSpriteNode(imageNamed: boxInstance.getTriangleName(1)+"fx")
        answerBoxFx!.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        answerBoxFx!.name = boxInstance.getTriangleName(1)+"fx"
        answerBoxFx!.zPosition = 98
        
        addChild(answerBoxFx!)
        
    }
    
    func createText(){
        labelAnswers =  SKLabelNode()
        labelAnswers?.fontSize = 20;
        labelAnswers?.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        labelAnswers?.fontColor = SKColor.whiteColor();
        labelAnswers?.name = "Texto";
        labelAnswers?.zPosition = 100;
    }
    
    func createButton() {
        ballsButton = SKSpriteNode(imageNamed: "8ballIcon")
        ballsButton!.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        ballsButton!.name = "ballsButton"
        ballsButton!.zPosition = 908
        
        addChild(ballsButton!)
    }
    
}
