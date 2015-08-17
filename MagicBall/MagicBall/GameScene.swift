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
    //4dc4ff
    
    var RespostaLabel: SKLabelNode?
    var bolinha: SKSpriteNode?
    
    override func didMoveToView(view: SKView){
        self.criarBolinha()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func criarBolinha() {
        bolinha = SKSpriteNode(imageNamed: "8ball")
        bolinha?.xScale = 1
        bolinha?.yScale = 1
        bolinha?.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        bolinha?.name = "8ball"
        //countDown?.text = "Esquerda"
        addChild(bolinha!)
    }
    
    func criarTextoScore(){
        RespostaLabel =  SKLabelNode()
        //RespostaLabel?.fontName = "Futura-Medium"
        RespostaLabel?.fontSize = 20;
        RespostaLabel?.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        RespostaLabel?.fontColor = SKColor.blackColor();
        RespostaLabel?.name = "Texto";
        RespostaLabel?.zPosition = 100;
        RespostaLabel?.text = "Sim"
        
        
        
        
        addChild(RespostaLabel!)
    }
    
    //    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?)
    //    {
    //        let label = SKLabelNode()
    //        var randomNumber = arc4random() % 4
    //        randomNumber += 1
    //
    //        switch(randomNumber)
    //        {
    //            case 1:
    //                label.text = "Resp 1"
    //                break;
    //
    //            case 2:
    //                label.text = "Resp 2"
    //                break;
    //
    //            case 3:
    //                label.text = "Resp 3"
    //                break;
    //
    //            case 4:
    //                label.text = "Resp 4"
    //                break;
    //
    //            default:
    //                label.text = "Default"
    //                break;
    //        }
    //    }
    
    
}
