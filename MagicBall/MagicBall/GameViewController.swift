//
//  GameViewController.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 17/08/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit
import SpriteKit

@IBDesignable

class GameViewController: UIViewController {
    var scene = GameScene()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scene = GameScene(fileNamed:"GameScene")!
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // fazendo a ação enquanto o celular se mexe
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            //scene.retiraTexto()
            print("little slow juice")
        }
    }
    
    // fazendo a ação quando o celular para
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            scene.mostrarTexto()
            print("Of milk!")
            //randomAnswer()
        }
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
}