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
    var turnControl = 0 // controlar a vez de cada opção
    var arrayBalls: Array<Balls> = Array() // vetor de bolas
    let ballWidth: CGFloat = 180.0 // largura das bolas
    let ballMargin: CGFloat = 57.0 // margem das bolas
    
    
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
        if sender.state == UIGestureRecognizerState.Ended
        {
            var touchLocation: CGPoint = sender.locationInView(sender.view)
            touchLocation = convertPointFromView(touchLocation)
            let node = nodeAtPoint(touchLocation)
            
            let time: NSTimeInterval = 0.1
            let blinkOut = SKAction.fadeOutWithDuration(time) // deixando mais escuro
            let blinkIn = SKAction.fadeInWithDuration(time) // deixando mais claro
            
            let blink = SKAction.sequence([blinkOut, blinkIn])
            
            let ballsInstance = Balls()
            
            if ballsInstance.getBallName(Int(node.name!)!) != "nada"
            {
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
    
    func panAction(gesture: UIPanGestureRecognizer)
    {
        if gesture.state == UIGestureRecognizerState.Changed
        {
            if turnControl == 0
            {
                let pos: CGPoint = gesture.translationInView(view)
                lastPoint = pos
                turnControl++
            }
            
            let translation: CGPoint = gesture.translationInView(view)
            let deslocPoint: CGPoint = CGPointMake(translation.x - lastPoint.x, translation.y - lastPoint.y)
            let action = SKAction.moveBy(CGVector(dx: deslocPoint.x, dy: 0), duration: 0)
            boxBall?.runAction(action)
            let position: CGPoint = gesture.translationInView(view)
            lastPoint = position
        }
        
        if gesture.state == UIGestureRecognizerState.Ended
        {
            turnControl = 0
            fixBallPosition()
        }
    }
    
    func fixBallPosition()
    {
        let ballQuantity = arrayBalls.count
        let xLimit = ballMargin * CGFloat(ballQuantity - 1) + ballWidth * CGFloat(ballQuantity)
        let firstDistance = (ballWidth + ballMargin) / 2
        let lastDistance = xLimit - (ballWidth + ballMargin / 2) - ballWidth / 2
        var currentPosition: Int = 0
        
        if abs(boxBall!.position.x) <= firstDistance || boxBall!.position.x > 0
        {
            boxBall!.runAction(SKAction.moveTo(CGPointZero, duration: 0.1))
        }
        else if abs(boxBall!.position.x) >= lastDistance
        {
            boxBall!.runAction(SKAction.moveTo(CGPointMake(-xLimit + ballWidth, 0), duration: 0.1))
            currentPosition = ballQuantity - 1
        }
        else
        {
            let jumpDistance = ballWidth + ballMargin
            var halfPosition: Int = 1
            var posTo: CGFloat = 0
            
            for var i = firstDistance + jumpDistance; i <= lastDistance; i += jumpDistance
            {
                if abs(boxBall!.position.x) < i
                {
                    posTo = i - ballMargin / 2 - ballWidth / 2
                    break
                }
                halfPosition++
            }
            boxBall!.runAction(SKAction.moveToX(-posTo, duration: 0.1))
            currentPosition = halfPosition
        }
    }
    
}