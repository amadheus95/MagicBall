//
//  ChooseBall.swift
//  MagicBall
//
//  Created by Rodrigo Machado on 8/20/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import SpriteKit
import UIKit

class ChooseBall: SKScene
{
    var boxBall: SKNode? // coleção das bolas
    var tapGesture: UITapGestureRecognizer? // ação - tap
    var panGesture: UIPanGestureRecognizer? // acompanhar o dedo
    var lastPoint = CGPointMake(0, 0) // última posição do dedo
    
    override func didMoveToView(view: SKView)
    {
        boxBall = self.childNodeWithName("boxBall")
        
        // chamando o tap
        tapGesture = UITapGestureRecognizer(target: self, action: Selector("tapAction:"))
        self.view?.addGestureRecognizer(tapGesture!)
        
        // chamando o a função de acompanhar o dedo
        panGesture = UIPanGestureRecognizer(target: self, action: Selector("panAction:"))
        self.view?.addGestureRecognizer(panGesture!)
        
        boxBall?.position = CGPointZero // setando na posição 0
    }
    
    func tapAction(sender: UITapGestureRecognizer)
    {
        // caso o tap tenha acabado
        if sender.state == UIGestureRecognizerState.Ended {
            var touchLocation: CGPoint = sender.locationInView(sender.view)
            touchLocation = convertPointFromView(touchLocation)
            let node = nodeAtPoint(touchLocation)
            
            let time: NSTimeInterval = 0.1
            let blinkOut = SKAction.fadeOutWithDuration(time) // deixando mais escuro
            let blinkIn = SKAction.fadeInWithDuration(time) // deixando mais claro
            
            let blink = SKAction.sequence([blinkOut, blinkIn])
            
            let ballsInstance = Balls()
            
            if ballsInstance.getBallName(Int(node.name!)!) != "nada" {
                //AQUI... deveriamos mexer no coreData
                
                print("CLICOU NO BOTAO DA BOLA: \(ballsInstance.getBallName(Int(node.name!)!))")
                let scene = GameScene()
                let skView = view
                skView!.ignoresSiblingOrder = true
                scene.scaleMode = .AspectFill
                skView!.presentScene(scene)
            }
            
        }
    }
    
    
    
    
    
}